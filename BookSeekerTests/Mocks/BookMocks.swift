import Foundation

public class BookMocks {
    
    static var livroDog = Book(title: "Dog1", author: "Author1", description: "Description1",
    image: "https://images-na.ssl-images-amazon.com/images/I/41K99%2BcInvL._SX326_BO1,204,203,200_.jpg",
    price: "43.25", currency: "R$", kind: "ebook", releaseDate: Date(), rating: 5.0)
    
    static var livroTeste = Book(title: "Teste", author: "Author Teste", description: "Test Description",
    image: "https://m.media-amazon.com/images/I/518xFkIKiiL.jpg",
    price: "10.25", currency: "R$", kind: "ebook", releaseDate: Date(), rating: 3.0)
    
    static var listaComUm = [livroDog]
    
    static var listaComDois = [livroDog, livroTeste]
    
}
