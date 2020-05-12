import Foundation

public class ListBooksMockUseCase: ListBooksUseCaseProtocol {

    var deveRetornarErro: Bool = false
    var livrosRetornados: [Book]?
    
    public init() {
    }
    
    public func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        if deveRetornarErro {
            completion(nil, ApiErrorResponse(code: -1, message: ""))
        } else {
            completion(livrosRetornados, nil)
        }
    }
}
