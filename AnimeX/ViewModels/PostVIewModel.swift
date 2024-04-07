//
//  PostVIewModel.swift
//  AnimeX
//
//  Created by Michael Waller on 4/7/24.
//

import Foundation
import UIKit
import ParseSwift


class PostViewModel: ObservableObject {
    @Published var postBody: String = ""
        @Published var showAlert: Bool = false
        @Published var alertMessage: String = ""
        @Published var selectedImage: UIImage? // Add this line
    let tweetMaxLength = 280 // Twitter's character limit
    
    func post() {
        guard !postBody.isEmpty else {
            alertMessage = "Tweet cannot be empty."
            showAlert = true
            return
        }
        
        guard postBody.count <= tweetMaxLength else {
            alertMessage = "Tweet exceeds the maximum character limit."
            showAlert = true
            return
        }
        
        var post = Post()
        post.user = User.current
        post.body = postBody
        if selectedImage != nil {
            if let imageData = selectedImage!.jpegData(compressionQuality: 0.5) {
                let namedFile = ParseFile(name: "image.jpg", data: imageData)
                post.contentFile = namedFile
                post.contentFileMimeType = "image/jpg"

                
                // imageData now contains your image in JPEG format with a compression quality of 0.5
            }
        }
        
        post.save() {result in
            switch result {
            case .success(_):
                self.postBody = ""
                self.selectedImage = nil
                self.alertMessage = "Post created successfully!"
                self.showAlert = true
                case .failure(let error):
                self.alertMessage = "Error creating post: \(error)"
                self.showAlert = true
                }
            
            
            
        }
    }
}
