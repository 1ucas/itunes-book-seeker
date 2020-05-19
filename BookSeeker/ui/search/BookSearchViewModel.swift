import Foundation
import RxSwift
import RxRelay

class BookSearchViewModel: BaseViewModel {

    private let listBooksUseCase: BaseListBooksUseCase
    private let storeUserSearchUseCase: StoreUserSearchUseCase = StoreUserSearchUseCase()
    private let listUserSearchUseCase: ListUserSearchUseCase = ListUserSearchUseCase()

    init(listBooksUseCase: BaseListBooksUseCase) {
        self.listBooksUseCase = listBooksUseCase
    }

    var booksToDisplay = BehaviorRelay<[Book]>(value: [])

    var searchesToDisplay = BehaviorRelay<[String]>(value: [])

    var errorListBooks  = BehaviorRelay<ApiErrorResponse>(value: ApiErrorResponse())

    func listBooks(title: String) {
        showLoading.accept(())
        let params = ListBooksUseCaseParams(title: title)
        listBooksUseCase.execute(input: params, completion: { bookList, error in
            if let bookList = bookList, let livros = bookList.livros {
                self.booksToDisplay.accept(livros)
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
            let buscarFiltradas = self.filtrarPalavrasProibidas(searches: searches)
            let buscarFiltradasV2 = self.filtrarBatata(searches: buscarFiltradas)
            self.searchesToDisplay.accept(buscarFiltradasV2)
        })
    }
    
    private func filtrarPalavrasProibidas(searches: [String]) -> [String] {
        return searches.filter { palavra -> Bool in
            return palavra != "Lucas"
        }
    }

    private func filtrarBatata(searches: [String]) -> [String] {
        return searches.filter { palavra -> Bool in
            return palavra != "Batata"
        }
    }
    
    func storeUserSearches(term: String) {
        showLoading.accept(())
        storeUserSearchUseCase.store(term: term, completion: { _ in
            self.hideLoading.accept(())
        })
    }
}
