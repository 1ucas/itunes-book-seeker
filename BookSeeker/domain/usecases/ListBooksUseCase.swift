import Foundation

public class ListBooksUseCase: ListBooksUseCaseProtocol {

    private let booksRepository: BookRepositoryProtocol
    
    init(repository: BookRepositoryProtocol = BookRepository()) {
        self.booksRepository = repository
    }

    public func execute(input: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        booksRepository.list(title: input, completion: { lista, apiError in

            if let apiError = apiError {
                completion(nil, apiError)
            } else {
                completion(lista, nil)
            }

        })
    }
}
