import Foundation
import Alamofire

class ApiClient: NSObject {
    
    public static let instance = ApiClient()
    
    private var sessionManager: Session?
    
    private override init() { }
}


extension ApiClient {
    
    func execute<T>(returnModel: T.Type, request: Requestable, completion: @escaping (T?, ApiErrorResponse?) -> Void) where T : Codable {
        
        let url = "\(Ambiente.BASE_URL)\(request.url)"
        
        sessionManager = Alamofire.Session.default
        
        sessionManager!.request(url, method: request.method, parameters: request.parameters, encoding: request.encoding).responseJSON { (response) in
            
            switch response.result {
            case .success:
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
                
            case .failure:
                completion(nil, ApiErrorResponse(code: -1, message: "Ocorreu um erro"))
            }
        }
    }
}

