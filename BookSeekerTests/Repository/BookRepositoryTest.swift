import Foundation
import Quick
import Nimble

class BookRepositoryTest: QuickSpec {
    
    private var repositorio: BookRepository!
    
    override func spec() {
        
        beforeEach {
            self.repositorio = BookRepository()
        }
        
        testBuscaComSucesso()
        
    }
    
    func testBuscaComSucesso() {
        describe("Teste Repositorio") {
            context("Dado que buscou um livro") {
                
                var livrosObtidos: [Book]?
                var erroApi: ApiErrorResponse?
                
                beforeEach {
                    // Dado que
                    
                    // Quando
                    self.repositorio.list(title: "Dog", completion: { lista, erro in
                        livrosObtidos = lista
                        erroApi = erro
                    })
                }
                
                // Então
                it("deve obter uma lista de livros") {
                    expect(livrosObtidos).toEventually(haveCount(50))
                }
                    
                it("nao deve retornar erro") {
                    expect(erroApi).toEventually(beNil())
                }
            }
        }
    }
    
}
