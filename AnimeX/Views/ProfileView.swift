import SwiftUI
import ParseSwift
import PhotosUI

struct ProfileView: View {
    @State private var selectedImage: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var editableDescription: String = User.current?.description ?? ""
    @State private var isSaving = false
    @State private var isEditing = false
    @MainActor @State private var userPosts = [Post]()
    @State private var isLoading = true
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    logoutButton
                    Spacer()
                }
                .padding(.leading)
                profileImageView
                usernameText
                descriptionSection
                postsSection
            }
            .padding()
            .task {
                await loadUserPosts()
            }
        }
    }
    
    private var logoutButton: some View {
        Button("Logout") {
            authManager.logout()
        }
        .padding()
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var profileImageView: some View {
        VStack {
            if let image = profileImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else if let user = User.current, let imageUrl = user.image?.url {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            }
            
            if isEditing {
                PhotosPicker("Select Profile Photo", selection: $selectedImage, matching: .images)
                    .onChange(of: selectedImage) { newValue in
                        Task {
                            if let data = try? await newValue?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    profileImage = Image(uiImage: uiImage)
                                    await uploadProfileImage(uiImage)
                                }
                            }
                        }
                    }
            }
        }
    }
    
    private var usernameText: some View {
        Text("@\(User.current?.username ?? "Username not found")")
            .font(.headline)
    }
    
    private var descriptionSection: some View {
        Group {
            if isEditing {
                TextField("Enter your description here...", text: $editableDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                    .disabled(isSaving)
            } else {
                Text(editableDescription)
                    .padding(.vertical)
            }
            Button(action: {
                self.isEditing.toggle()
            }) {
                Text(isEditing ? "Cancel" : "Edit")
            }
            .padding(.top, 5)
            if isEditing {
                Button("Save") {
                    isSaving = true
                    guard var currentUser = User.current else { return }
                    currentUser.description = editableDescription
                    currentUser.save { result in
                        switch result {
                        case .success(_):
                            print("Description updated successfully")
                        case .failure(let error):
                            print("Failed to update description: \(error.localizedDescription)")
                        }
                        isSaving = false
                        isEditing = false
                    }
                }
                .disabled(isSaving)
                .padding(.top)
            }
        }
    }
    
    private var postsSection: some View {
        Group {
            if isLoading {
                Text("Loading posts...")
                    .padding()
            } else if !self.userPosts.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        ForEach(self.userPosts, id: \.objectId) { post in
                            HStack(alignment: .top, spacing: 10) {
                                if let userImageUrl = User.current?.image?.url {
                                    AsyncImage(url: userImageUrl) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                        case .failure:
                                            Image(systemName: "person.crop.circle.fill")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(User.current?.username ?? "Unknown User")
                                        .font(.headline)
                                    if let body = post.body {
                                        Text(body)
                                            .font(.body)
                                    } else {
                                        Text("No content")
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                    if let createdAt = post.createdAt {
                                        Text("Posted on: \(createdAt.formatted())")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                    .padding(.top)
                }
            } else {
                Text("No posts found.")
                    .padding()
            }
        }
    }
    
    @MainActor
    private func loadUserPosts() async {
        guard let currentUser = User.current else { return }
        
        do {
            let query = try await Post.query("user" == currentUser.toPointer()).find()
            self.userPosts = query
            self.isLoading = false
            print("Loaded posts: \(query)")
        } catch {
            print("Error loading posts: \(error.localizedDescription)")
            self.isLoading = false
        }
    }
    
    @MainActor
    private func uploadProfileImage(_ uiImage: UIImage) async {
        guard var currentUser = User.current else { return }
        
        guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert UIImage to Data.")
            return
        }
        
        let imageFile = ParseFile(name: "profile.jpg", data: imageData)
        currentUser.image = imageFile
        
        do {
            try await currentUser.save()
            print("Profile image uploaded successfully.")
        } catch {
            print("Error uploading profile image: \(error.localizedDescription)")
        }
    }
}
