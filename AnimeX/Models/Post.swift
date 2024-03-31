//
//  Post.swift
//  AnimeX
//
//  Created by Michael Waller on 3/31/24.
//

import Foundation
import ParseSwift


struct Post: ParseObject {
    // These properties are required by ParseObject

    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?

    // Custom properties
    var author: String?
    var body: String?
    var contentFile:  ParseFile?
}
