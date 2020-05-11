import Foundation
import UIKit

class BookSeekerCoordinator: Coordinator {

    var bookSeekerContainer: BookSeekerContainer!
    private var currentNavigationController: UINavigationController!

    public init() {
        bookSeekerContainer = BookSeekerContainer(mockSetup: false)
        // Inicializar Código de Injeção de Dependencias
    }

    public func start(navigationController: UINavigationController) {
        let bookSearchVC = BookSearchViewController.instantiate()
        bookSearchVC.coordinator = self

        bookSearchVC.viewModel = bookSeekerContainer.container.resolve(BookSearchViewModel.self)
        self.currentNavigationController = navigationController
        self.currentNavigationController.pushViewController(bookSearchVC, animated: true)
    }

    public func showBookList(books: [Book]) {
        let bookListVC = BookListViewController.instantiate()
        bookListVC.coordinator = self
        bookListVC.viewModel = BookListViewModel(books: books)
        self.currentNavigationController.show(bookListVC, sender: self)
    }

    public func showBookDetail(book: Book) {
        let bookDetailVC = BookDetailViewController.instantiate()
        bookDetailVC.coordinator = self
        bookDetailVC.viewModel = BookDetailViewModel()
        bookDetailVC.viewModel.book = book
        self.currentNavigationController.show(bookDetailVC, sender: self)
    }

}
