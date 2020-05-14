import Foundation
import UIKit

class BookSeekerCoordinator: Coordinator {

    private var bookSeekerContainer: BookSeekerContainer!
    private var currentNavigationController: UINavigationController!

    public init() {
        bookSeekerContainer = BookSeekerContainer()
        // Inicializar Código de Injeção de Dependencias
    }

    public func start(navigationController: UINavigationController) {
        let bookSearchVM = bookSeekerContainer.container.resolve(BookSearchViewModel.self)!
        let bookSearchVC = BookSearchViewController.instantiate(viewModel: bookSearchVM, coordinator: self)
        
        self.currentNavigationController = navigationController
        self.currentNavigationController.pushViewController(bookSearchVC, animated: true)
    }

    public func showBookList(books: [Book]) {
        let bookListVM = BookListViewModel(books: books)
        let bookListVC = BookListViewController.instantiate(viewModel: bookListVM, coordinator: self)
        
        self.currentNavigationController.show(bookListVC, sender: self)
    }

    public func showBookDetail(book: Book) {
        let bookDetailVM = BookDetailViewModel()
        let bookDetailVC = BookDetailViewController.instantiate(viewModel: bookDetailVM, coordinator: self)
        bookDetailVC.viewModel.book = book
        
        self.currentNavigationController.show(bookDetailVC, sender: self)
    }

}
