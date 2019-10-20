import Foundation
import RxRelay

class BookDetailViewModel: BaseViewModel {

    var book: Book?
    var loadedBook = BehaviorRelay<Book?>(value: nil)

    func loadBookDetails() {
        loadedBook.accept(self.book)
    }

}
