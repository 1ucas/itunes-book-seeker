import Foundation
import Alamofire

class ApiClient: NSObject {
    
    private let BASE_URL = "https://itunes.apple.com/"
    
    public static let instance = ApiClient()
    
    private var sessionManager: SessionManager?
    
    private override init() { }
}


extension ApiClient {
    
    func execute<T>(returnModel: T.Type, request: Requestable, completion: @escaping (T?, ApiErrorResponse?) -> Void) where T : Codable {
        
        let url = "\(BASE_URL)\(request.url)"
        
        sessionManager = Alamofire.SessionManager.default
        
        sessionManager!.request(url, method: request.method, parameters: request.parameters, encoding: request.encoding).responseJSON { (response) in
            
            if response.result.isSuccess {
                if let httpResponseCode = response.response?.statusCode {
                    switch httpResponseCode {
                    case 200:
                        do {
                            let retorno = try JSONDecoder().decode(returnModel, from: response.data!)
                            completion(retorno, nil)
                            
                        } catch let error {
                            completion(nil, ApiErrorResponse(code: error._code, message: error.localizedDescription))
                        }
                        
                    default:
                        completion(nil, ApiErrorResponse(code: -1, message: "Ocorreu um erro"))
                    }
                }
                
            } else {
                completion(nil, ApiErrorResponse(code: -1, message: "Ocorreu um erro"))
            }
        }
    }
    
}

