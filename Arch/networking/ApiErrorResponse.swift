import Foundation

public struct ApiErrorResponse : Codable {
    
    public let code: Int
    public let message: String
    
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    public init() {
        code = -1
        message = ""
    }
}
