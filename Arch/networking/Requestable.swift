import Foundation
import Alamofire

public protocol Requestable {
    var url: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get set }
}


public extension Requestable {
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
