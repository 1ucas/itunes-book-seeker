import Foundation

public class ListBooksUseCase: ListBooksUseCaseProtocol {

    private var booksRepository: BookRepositoryProtocol?
    
    init() {}
    init(repository: BookRepositoryProtocol) {
        self.booksRepository = repository
    }

    public func execute(input: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        guard let booksRepository = booksRepository else { return }
        booksRepository.list(title: input, completion: { lista, apiError in

            if let apiError = apiError {
                completion(nil, apiError)
            } else {
                completion(lista, nil)
            }

        })
    }
}
