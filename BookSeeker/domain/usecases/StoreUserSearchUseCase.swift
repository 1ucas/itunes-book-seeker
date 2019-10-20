import Foundation

class StoreUserSearchUseCase {

    private let searchRepository: SearchRepository = SearchRepository()

}

extension StoreUserSearchUseCase {

    func store(term: String, completion: @escaping (Bool) -> Void) {
        searchRepository.store(term: term, completion: completion)
    }
}
