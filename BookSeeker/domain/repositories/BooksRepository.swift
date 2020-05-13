import Foundation

class BookRepository {

    private var apiClient = ApiClient.instance

    public init() { }
}

extension BookRepository: BookRepositoryProtocol {
    
    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void ) {
        var request = ListBooksRequest()
        request.url = request.url.setUrlParameter("title", title)

        apiClient.execute(returnModel: ItunesSearchResponse.self, request: request) { response, error in
            if let error = error {
                completion(nil, error)

            } else {
                let booksDTO = response?.results
                var books = [Book]()
                guard let bookListDTO = booksDTO else { return completion(nil, nil) }
                for book in bookListDTO {
                    books.append(book.toModel())
                }

                completion(books, nil)
            }
        }
    }
}
