
import Foundation

public class UseCaseException: Error {
    
    let code:Int!
    let msg:String!
    
    init(code:Int, msg:String) {
        self.code = code
        self.msg = msg
    }
    
}
