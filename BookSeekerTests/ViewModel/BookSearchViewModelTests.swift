import Foundation
import Swinject
import XCTest
import Quick
import Nimble
import RxSwift

@testable import BookSeeker

class BookSearchViewModelTests: QuickSpec {

    private var viewModel: BookSearchViewModel!
    private var useCase: ListBooksMockUseCase!
    private var disposeBag: DisposeBag!

    override func spec() {
        
        beforeEach {
            self.useCase = ListBooksMockUseCase()
            self.viewModel = BookSearchViewModel(listBooksUseCase: self.useCase)
            self.disposeBag = DisposeBag()
        }
        
        testBuscaComSucesso()
        testBuscaComErro()
    }
    
    func testBuscaComSucesso() {
        describe("Teste Busca") {
            context("Dado que buscou um livro") {
                
                var livrosObtidos: [Book] = []
                
                beforeEach {
                    // Dado que
                    self.useCase.deveRetornarErro = false
                    self.useCase.livrosRetornados = BookMocks.listaComUm
                    
                    self.viewModel.booksToDisplay.asObservable().subscribe(
                        onNext: { livros in
                            livrosObtidos = livros
                    }).disposed(by: self.disposeBag)
                    
                    // Quando
                    self.viewModel.listBooks(title: "Dog")
                }
                
                // Então
                it("deve obter uma lista de livros") {
                    expect(livrosObtidos).toEventually(haveCount(1))
                }
            }
        }
    }
    
    func testBuscaComErro() {
        describe("Teste Busca") {
            context("Dado que buscou um livro") {
                
                var livrosObtidos: [Book]?
                var erroApi: ApiErrorResponse?
                
                beforeEach {
                    // Dado que
                    self.useCase.deveRetornarErro = true
                    
                    self.viewModel.booksToDisplay.asObservable().subscribe(
                        onNext: { livros in
                            livrosObtidos = livros
                    }).disposed(by: self.disposeBag)
                    
                    self.viewModel.errorListBooks.asObservable().subscribe(
                        onNext: { erro in
                            erroApi = erro
                        }
                    ).disposed(by: self.disposeBag)
                    
                    // Quando
                    self.viewModel.listBooks(title: "Dog")
                }
                
                // Então
                it("nao deve obter nenhum livro") {
                    expect(livrosObtidos).toEventually(beNil())
                }
                
                it("e deve retornar erro") {
                    expect(erroApi).toNotEventually(beNil())
                }
            }
        }
    }

    override func tearDown() {
        viewModel = nil
    }
}
