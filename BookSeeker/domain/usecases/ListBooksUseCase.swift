import Foundation

class ListBooksUseCase {

    private let booksRepository: BookRepository = BookRepository()

}

extension ListBooksUseCase {

    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        booksRepository.list(title: title, completion: completion)
    }
}
