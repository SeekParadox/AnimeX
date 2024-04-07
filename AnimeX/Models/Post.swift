import Foundation
import ParseSwift

struct Post: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var user: User?
    var body: String?
//    var user: User? //Michael was using
    var contentFile:  ParseFile?
    var contentFileMimeType: String?

}
