//
//  FeedViewModel.swift
//  AnimeX
//
//  Created by Michael Waller on 4/6/24.
//
import Foundation
import ParseSwift
class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func updateFeed(forUserId userId: Pointer<User>) {

        let followQuery = UserFollow.query("follower" == userId)
        followQuery.find { [weak self] result in
            switch result {
            case .success(let userFollows):
                // Extract followee pointers
                let followedUserPointers = userFollows.compactMap { $0.followee }
            
                let followedUserIds = followedUserPointers.map { $0.objectId }

                self?.fetchRecentPosts(fromUserIds: followedUserIds) { posts in
                    DispatchQueue.main.async {
                        self?.posts = posts
                    }
                }

            case .failure(let error):
                print("Error fetching followed users: \(error.localizedDescription)")
            }
        }
    }

    private func fetchRecentPosts(fromUserIds userIds: [String], completion: @escaping ([Post]) -> Void) {
        for item in userIds {
            print("Current user follows user with id: " + item)
        }

        
        guard !userIds.isEmpty else {
            completion([])
            return
        }

        let query = Post
            .query(containedIn(key: "user", array: userIds))
            .include("user")
            .include("contentFile")
            .order([.descending("createdAt")])
            .limit(10)

        query.find { result in
            switch result {
            case .success(let posts):
                completion(posts)
            case .failure(let error):
                print("Error fetching recent posts: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}
