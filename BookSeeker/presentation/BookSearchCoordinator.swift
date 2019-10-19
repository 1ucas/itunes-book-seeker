import Foundation
import UIKit

class BookSearchCoordinator: Coordinator {

    var currentNavigationController: UINavigationController!

    public init() {
        // Inicializar Código de Injeção de Dependencias
    }

    public func start(navigationController: UINavigationController) {
        let bookSearchVC = BookSearchViewController.instantiate(storyboardName: "BookSearch", bundle: Bundle.main)
        bookSearchVC.coordinator = self
        bookSearchVC.viewModel = BookSearchViewModel()
        self.currentNavigationController = navigationController
        self.currentNavigationController.pushViewController(bookSearchVC, animated: false)
    }

}
