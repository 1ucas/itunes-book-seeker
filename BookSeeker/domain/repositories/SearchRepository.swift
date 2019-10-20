import Foundation

class SearchRepository {

    public init() { }
}

extension SearchRepository {
    func store(term: String, completion: @escaping (Bool) -> Void ) {
        if let searches = UserDefaults.standard.array(forKey: "searches") {
            var newSearches = searches
            newSearches.insert(term, at: 0)
            UserDefaults.standard.set(newSearches, forKey: "searches")
            UserDefaults.standard.synchronize()
        } else {
            let firstSearch = [term]
            UserDefaults.standard.set(firstSearch, forKey: "searches")
            UserDefaults.standard.synchronize()
        }
    }

    func list(completion: @escaping ([String]) -> Void) {
        var searches: [String] = []
        if let userSearches = UserDefaults.standard.array(forKey: "searches") {
            for search in userSearches {
                searches.append(String.fromAny(object: search))
            }
        }
        return completion(searches)
    }
}
