import Foundation
import ParseSwift

struct Comment: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var post: Post?
    var author: String?
    var comment: String?
}
