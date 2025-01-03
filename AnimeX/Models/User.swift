import Foundation
import ParseSwift

final class User: ParseUser {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.objectId == rhs.objectId
    }
    
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var updatedAt: Date?
    var password: String?
    var authData: [String : [String : String]?]?
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var ACL: ParseSwift.ParseACL?
    var DOB: Date?
    var image: ParseFile?
    var description: String?
}
