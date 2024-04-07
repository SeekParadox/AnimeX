//
//  PostView.swift
//  AnimeX
//
//  Created by Michael Waller on 4/1/24.

import SwiftUI

import SwiftUI

struct PostView: View {
    @StateObject private var viewModel = PostViewModel()
    @State private var showImagePicker = false
        
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $viewModel.postBody)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)
                    .padding()
                
                HStack {
                    Spacer()
                    Text("\(viewModel.postBody.count)/\(viewModel.tweetMaxLength)")
                        .foregroundColor(viewModel.postBody.count > viewModel.tweetMaxLength ? .red : .gray)
                        .padding(.trailing)
                }
                
                Button(action: viewModel.post) {
                    Text("Post")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
                Spacer()
                
                if let image = viewModel.selectedImage { // Use the ViewModel's image here
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                Button("Open Camera") {
                    showImagePicker = true
                }
            } .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        
            
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: .camera) // Bind directly to ViewModel's selectedImage
            }
        }
        .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        .navigationTitle("Create Post")
        
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Message"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}
