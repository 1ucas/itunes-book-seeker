import Foundation
import UIKit

class BookSeekerCoordinator: Coordinator {

    var currentNavigationController: UINavigationController!

    public init() {
        // Inicializar Código de Injeção de Dependencias
    }

    public func start(navigationController: UINavigationController) {
        let bookSearchVC = BookSearchViewController.instantiate(storyboardName: "BookSearch", bundle: Bundle.main)
        bookSearchVC.coordinator = self
        bookSearchVC.viewModel = BookSearchViewModel()
        self.currentNavigationController = navigationController
        self.currentNavigationController.pushViewController(bookSearchVC, animated: true)
    }

    public func showBookList(books: [Book]) {
        let bookListVC = BookListViewController.instantiate(storyboardName: "BookList", bundle: Bundle.main)
        bookListVC.coordinator = self
        bookListVC.viewModel = BookListViewModel(books: books)
        self.currentNavigationController.show(bookListVC, sender: self)
    }

}
