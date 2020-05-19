import Foundation

class ListBooksMockUseCase: BaseListBooksUseCase {

    var deveRetornarErro: Bool = false
    var livrosRetornados: [Book]?
    
    override func execute(input: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        if deveRetornarErro {
            completion(nil, ApiErrorResponse(code: -1, message: ""))
        } else {
            completion(livrosRetornados, nil)
        }
    }
}
