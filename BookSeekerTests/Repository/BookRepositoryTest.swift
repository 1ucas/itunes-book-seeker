import Swifter
import Quick
import Nimble

@testable import BookSeeker

class BookRepositoryTest: QuickSpec {
    
    private var repositorio: BookRepository!

    private var server: HttpServer!
    
    override func setUp() {
        
    }
    
    override func spec() {
        do {
            self.server = HttpServer()
            
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(BookMocks.resultadoComUmLivro)
            let dataString = String(data: data, encoding: .utf8)
            
            self.server["/search"] = { _ in .ok(.text(dataString!))  }
            try self.server.start()
            
            Ambiente.BASE_URL = AmbientesApi.TESTES.rawValue
            self.repositorio = BookRepository()
        } catch {
            print("Server - Error - \(error)")
        }
        
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
                it("deve obter uma lista de livros") {
                    expect(livrosObtidos).toEventually(haveCount(1))
                }
                    
                it("nao deve retornar erro") {
                    expect(erroApi).toEventually(beNil())
                }
            }
        }
    }
    
}
