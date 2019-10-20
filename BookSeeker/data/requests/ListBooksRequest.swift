import Foundation
import Alamofire

struct ListBooksRequest: Requestable {

    var url: String = "search?term={title}&entity=ibook"
    var method: HTTPMethod = .get
    var parameters: Parameters?

}
