import Foundation
import RxRelay

class BookListViewModel: BaseViewModel {

    var booksToDisplay = PublishRelay<[Book]>()

    private let books: [Book]

    init(books: [Book]) {
        self.books = books
    }

    func loadBooks() {
        booksToDisplay.accept(self.books)
    }

}
