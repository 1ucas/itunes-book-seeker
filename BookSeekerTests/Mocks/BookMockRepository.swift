import Foundation

class BookMockRepository: BookRepositoryProtocol {
    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void) {
        if title == "Lucas" {
            completion(nil, ApiErrorResponse(code: -100, message: "Mock Response"))
        } else if title ==  "Dog" {
            let books = [Book(title: "Dog1", author: "Author1", description: "Description1",
                              image: "https://images-na.ssl-images-amazon.com/images/I/41K99%2BcInvL._SX326_BO1,204,203,200_.jpg",
                              price: "43.25", currency: "R$", kind: "ebook", releaseDate: Date(), rating: 5.0)]
            completion(books, nil)
        }
    }
}
