import Foundation
import Swinject

class BookSeekerContainer {

    public let container = Container()
    
    public init(mockRepository: Bool = false) {
        registerRepository(mockRepository)
        registerUseCases()
        registerViewModels()
    }
    
}

extension BookSeekerContainer {
    
    public func registerRepository(_ mockRepository: Bool) {
        if mockRepository {
            container.register(BookRepositoryProtocol.self) { _  in BookMockRepository() }
        } else {
            container.register(BookRepositoryProtocol.self) { _  in BookRepository() }
        }
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
