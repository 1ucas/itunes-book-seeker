import Foundation

class BookMockRepository: BookRepositoryProtocol {
    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        if title == "Lucas" {
            completion(nil, ApiErrorResponse(code: -100, message: "Mock Response"))
        } else if title ==  "Dog" {
            let books = BookMocks.listaComUm
            completion(books, nil)
        }
    }
}
