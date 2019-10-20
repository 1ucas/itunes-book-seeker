import Foundation

struct BookDTO: Codable {
    let artistID: Int?
    let artistName: String?
    let artistViewURL: String?
    let artworkUrl100, artworkUrl60: String?
    let averageUserRating: Decimal?
    let currency, bookDTODescription: String?
    let fileSizeBytes: Int?
    let formattedPrice: String?
    let genreIDS: [Int]?
    let genres: [String]?
    let kind: String?
    let price: Decimal?
    let releaseDate: String?
    let trackCensoredName: String?
    let trackID: Int?
    let trackName: String?
    let trackViewURL: String?
    let userRatingCount: Int?
}
extension BookDTO {

    func toModel() -> Book {
        return Book(title: trackName!)
    }
}
