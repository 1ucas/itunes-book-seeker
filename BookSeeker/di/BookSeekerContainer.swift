import Foundation
import Swinject

class BookSeekerContainer {

    public let container = Container()

    public func setup() {

        // Repository
        container.register(BookRepositoryProtocol.self) { _  in BookRepository() }

        // UseCase
        container.register(ListBooksUseCase.self) { resolver in
            let repository = resolver.resolve(BookRepositoryProtocol.self)
            return ListBooksUseCase(repository: repository!)
        }

        // ViewModel
        container.register(BookSearchViewModel.self) { resolver in
            let useCase = resolver.resolve(ListBooksUseCase.self)
            return BookSearchViewModel(listBooksUseCase: useCase!)
        }

    }

    public func mockSetup() {

        // Repository
        container.register(BookRepositoryProtocol.self) { _  in BookMockRepository() }

        // UseCase
        container.register(ListBooksUseCase.self) { resolver in
            let repository = resolver.resolve(BookRepositoryProtocol.self)
            return ListBooksUseCase(repository: repository!)
        }
    }

    public init() { }

    public init(mockSetup: Bool) {
        if mockSetup {
            self.mockSetup()
        } else {
            setup()
        }
    }
}
