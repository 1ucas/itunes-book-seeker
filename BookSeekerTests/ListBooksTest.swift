import Quick
import Nimble
import Swinject

class ListBooksTest: QuickSpec {

    var useCase: ListBooksUseCase!

    override func spec() {
        describe("Pesqusia de Livro") {

            beforeEach {
                self.useCase = ListBooksUseCase(repository: BookMockRepository())
            }

            context("Dado que o usuário pesquisa um livro") {

                context("Quando a lista é retornada com sucessso") {

                    it("Então deve retornar uma lista de livros") {
                        self.useCase?.execute(input: "Dog", completion: { books, error in
                            expect(books).toNot(beNil())
                            expect(error).to(beNil())
                            expect(books?.count).to(equal(1))
                        })
                    }
                }

                context("Quando a lista é retornada com erro") {

                    it("Então deve ser retornada uma exception de caso de uso") {
                    }
                }
            }
        }
    }
}
