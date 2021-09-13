import Foundation
import RxRelay

class BookDetailViewModel: BaseViewModel {

    var book: Book?
    var loadedBook = PublishRelay<Book?>()

    func loadBookDetails() {
        loadedBook.accept(self.book)
    }

}
