import Foundation

class ListUserSearchUseCase {

    private let searchRepository: SearchRepository = SearchRepository()

}

extension ListUserSearchUseCase {

    func list(completion: @escaping ([String]) -> Void) {
        searchRepository.list(completion: completion)
    }
}
