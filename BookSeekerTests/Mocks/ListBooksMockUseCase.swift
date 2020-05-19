import Foundation

class ListBooksMockUseCase: BaseListBooksUseCase {

    var deveRetornarErro: Bool = false
    var livrosRetornados: [Book]?
    
    override func execute(input: ListBooksUseCaseParams, completion: @escaping (ListBooksUseCaseResponse?, ApiErrorResponse?) -> Void) {
        if deveRetornarErro {
            completion(nil, ApiErrorResponse(code: -1, message: ""))
        } else {
            let response = ListBooksUseCaseResponse(livros: livrosRetornados)
            completion(response, nil)
        }
    }
}
