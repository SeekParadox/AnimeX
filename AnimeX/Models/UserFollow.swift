//
//  UserFollow.swift
//  AnimeX
//
//  Created by Michael Waller on 4/6/24.
//

import Foundation
import ParseSwift

struct UserFollow: ParseObject {
    // Required properties for ParseObject protocol

    var originalData: Data?
    
    var objectId: String?
    
    var createdAt: Date?
    
    var updatedAt: Date?
    
    var ACL: ParseACL?

    // Relationship properties using User.ID
    var follower: Pointer<User>?
    var followee: Pointer<User>?
}
