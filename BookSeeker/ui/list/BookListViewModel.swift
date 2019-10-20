import Foundation
import RxRelay

class BookListViewModel: BaseViewModel {

    var booksToDisplay = BehaviorRelay<[Book]>(value: [])

    private let books: [Book]

    init(books: [Book]) {
        self.books = books
    }

    func loadBooks() {
        booksToDisplay.accept(self.books)
    }

}
