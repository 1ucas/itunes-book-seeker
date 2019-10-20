import Foundation

struct ItunesSearchResponse: Codable {
    let resultCount: Int
    let results: [BookDTO]
}
