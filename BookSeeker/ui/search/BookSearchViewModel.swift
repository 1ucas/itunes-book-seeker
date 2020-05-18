import Foundation
import RxSwift
import RxRelay

class BookSearchViewModel: BaseViewModel {

    private let listBooksUseCase: ListBooksUseCase
    private let storeUserSearchUseCase: StoreUserSearchUseCase = StoreUserSearchUseCase()
    private let listUserSearchUseCase: ListUserSearchUseCase = ListUserSearchUseCase()

    init(listBooksUseCase: ListBooksUseCase) {
        self.listBooksUseCase = listBooksUseCase
    }

    var booksToDisplay = BehaviorRelay<[Book]>(value: [])

    var searchesToDisplay = BehaviorRelay<[String]>(value: [])

    var errorListBooks  = BehaviorRelay<ApiErrorResponse>(value: ApiErrorResponse())

    func listBooks(title: String) {
        showLoading.accept(())
        listBooksUseCase.execute(input: title, completion: { bookList, error in
            if let bookList = bookList {
                self.booksToDisplay.accept(bookList)
            } else {
                if let error = error {
                    self.errorListBooks.accept(error)
                }
            }
            self.hideLoading.accept(())
        })
    }

    func listUserSearches() {
        showLoading.accept(())
        listUserSearchUseCase.list(completion: { searches in
            self.hideLoading.accept(())
            self.searchesToDisplay.accept(searches)
        })
    }

    func storeUserSearches(term: String) {
        showLoading.accept(())
        storeUserSearchUseCase.store(term: term, completion: { _ in
            self.hideLoading.accept(())
        })
    }
}
