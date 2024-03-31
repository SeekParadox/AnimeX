//
//  User.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import Foundation
import ParseSwift


struct AnimeXUser: ParseObject {
    
    // These properties are required by ParseObject

    var originalData: Data?
    
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?

    // Custom properties
    var userName: String?
    var password: String?
    var emailVerified: Bool?
    var email: String?
    var DOB: Date?
}
