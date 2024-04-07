//
//  FeedView.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import SwiftUI
import ParseSwift
import AVKit

struct AnimeXPostView: View {
    var post: Post

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
        
        
            AsyncImage(url: post.user?.image?.url) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Shows a loader while the image is loading
                case .success(let image):
                    image.resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())// Display the loaded image
                case .failure:
                    Image(systemName: "photo") // Shows a placeholder image in case of failure
                @unknown default:
                    EmptyView() // Fallback for future cases
                }
            }
            
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(post.user?.username ?? "Unknown User")
                        .fontWeight(.bold)
                
                Text(post.body!)
            
                
                if let contentFileURL = post.contentFile?.url, let mimeType = post.contentFileMimeType {
                    let isVideo = mimeType.starts(with: "video/")
                    
                    if isVideo {
                            VideoPlayer(player: AVPlayer(url: contentFileURL))
                                .frame(height: 200)
                    } else {
                            AsyncImage(url: contentFileURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure:
                                    Image(systemName: "photo")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(height: 200)
                    }
                }
                
                
                HStack {
                    Spacer()

                      Button(action: {}) {
                          Image(systemName: "heart")
                      }

                      Spacer()

                      Button(action: {}) {
                          Image(systemName: "arrow.turn.up.right")
                      }

                      Spacer()

                      Button(action: {}) {
                          Image(systemName: "bubble.left")
                      }

                      Spacer()
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct FeedView: View {
    @StateObject var feedViewModel = FeedViewModel()
    
       
       var body: some View {
           NavigationView {
               List(feedViewModel.posts, id: \.objectId) { post in
                   AnimeXPostView(post: post)
               }
               .navigationTitle("Feed")
               .onAppear {
                   if let currentUserId = User.current?.objectId {
                       let currentUserPointer = Pointer<User>(objectId: currentUserId)
                       feedViewModel.updateFeed(forUserId: currentUserPointer)
                   }
               }
           }
       }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
