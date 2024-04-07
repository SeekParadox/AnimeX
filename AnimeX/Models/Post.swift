import Foundation
import ParseSwift

struct Post: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var user: Pointer<User>?
    var body: String?
}
