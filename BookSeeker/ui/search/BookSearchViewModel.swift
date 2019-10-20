import Foundation
import RxSwift
import RxRelay

class BookSearchViewModel: BaseViewModel {

    private let listBooksUseCase: ListBooksUseCase = ListBooksUseCase()

    var booksToDisplay = BehaviorRelay<[Book]>(value: [])

    var errorListBooks  = BehaviorRelay<ApiErrorResponse>(value: ApiErrorResponse())

    let bag = DisposeBag()

    func listBooks(title: String) {
        listBooksUseCase.list(title: title, completion: { bookList, error in
            if let bookList = bookList {
                self.booksToDisplay.accept(bookList)
            } else {
                if let error = error {
                    self.errorListBooks.accept(error)
                }
            }
        })
    }
}
