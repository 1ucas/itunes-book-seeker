import Foundation

class BaseListBooksUseCase: UseCaseProtocol {
    typealias InputType = String
    typealias OutputType = [Book]?

    func execute(input: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        fatalError("Método deve ser sobrescrito.")
    }
}

class ListBooksUseCase: BaseListBooksUseCase {

    private let booksRepository: BookRepositoryProtocol
    
    init(repository: BookRepositoryProtocol) {
        self.booksRepository = repository
    }

    override func execute(input: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        booksRepository.list(title: input, completion: { lista, apiError in

            if let apiError = apiError {
                completion(nil, apiError)
            } else {
                completion(lista, nil)
            }

        })
    }
}
