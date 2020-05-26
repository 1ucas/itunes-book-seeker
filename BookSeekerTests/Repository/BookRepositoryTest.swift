import Quick
import Nimble

@testable import BookSeeker

class BookRepositoryTest: QuickSpec {
    
    private var repositorio: BookRepository!
    
    override func tearDown() {
    }
    
    override func spec() {
        runServer {
            BookMockServer.registerResponse(route: "/search", object: BookMocks.resultadoComUmLivro)
        }
        self.repositorio = BookRepository()
        
        testBuscaComSucesso()
    }
    
    func testBuscaComSucesso() {
        describe("Teste Repositorio") {
            context("Dado que buscou um livro") {
                
                var livrosObtidos: [Book]?
                var erroApi: ApiErrorResponse?
                
                self.repositorio.list(title: "Dog", completion: { lista, erro in
                    livrosObtidos = lista
                    erroApi = erro
                })
                
                // Então
                it("nao deve retornar erro") {
                    expect(erroApi).toEventually(beNil())
                }
                
                it("deve obter uma lista de livros") {
                    expect(livrosObtidos).toEventually(haveCount(1))
                }
            }
        }
    }
    
    private func runServer(registrations: () -> Void) {
        registrations()
        BookMockServer.start()
    }
    
}
