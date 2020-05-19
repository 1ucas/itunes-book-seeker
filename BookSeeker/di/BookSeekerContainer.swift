import Foundation
import Swinject

class BookSeekerContainer {

    public let container = Container()
    
    public init() {
        registerRepository()
        registerUseCases()
        registerViewModels()
    }
    
}

extension BookSeekerContainer {
    
    public func registerRepository() {
        container.register(BookRepositoryProtocol.self) { _  in BookRepository() }
    }
    
    private func registerUseCases() {
        container.register(BaseListBooksUseCase.self) { resolver in
            let repository = resolver.resolve(BookRepositoryProtocol.self)
            return ListBooksUseCase(repository: repository!)
        }
    }
    
    private func registerViewModels() {
        container.register(BookSearchViewModel.self) { resolver in
            let useCase = resolver.resolve(BaseListBooksUseCase.self)
            return BookSearchViewModel(listBooksUseCase: useCase!)
        }
    }

}
