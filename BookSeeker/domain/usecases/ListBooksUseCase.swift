import Foundation

public class ListBooksUseCase {

    private let booksRepository: BookRepositoryProtocol

    init(repository: BookRepositoryProtocol) {
        self.booksRepository = repository
    }

    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        booksRepository.list(title: title, completion: { lista, apiError in

            if let apiError = apiError {
                completion(nil, apiError)
            } else {
                completion(lista, nil)
            }

        })
    }
}
