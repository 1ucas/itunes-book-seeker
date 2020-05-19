import Foundation

class BaseListBooksUseCase: UseCaseProtocol {
    func execute(input: ListBooksUseCaseParams, completion: @escaping (ListBooksUseCaseResponse?, ApiErrorResponse?) -> Void) {
        fatalError("Método deve ser sobrescrito.")
    }
}

class ListBooksUseCase: BaseListBooksUseCase {

    private let booksRepository: BookRepositoryProtocol
    
    init(repository: BookRepositoryProtocol) {
        self.booksRepository = repository
    }

    override func execute(input: ListBooksUseCaseParams, completion: @escaping (ListBooksUseCaseResponse?, ApiErrorResponse?) -> Void) {
        booksRepository.list(title: input.title, completion: { resposta, apiError in

            if let apiError = apiError {
                completion(nil, apiError)
            } else {
                let resposta = ListBooksUseCaseResponse(livros: resposta)
                completion(resposta, nil)
            }

        })
    }
}

struct ListBooksUseCaseParams {
    let title: String
}

struct ListBooksUseCaseResponse {
    let livros: [Book]?
}
