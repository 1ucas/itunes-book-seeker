import Quick
import Nimble
import Swinject

@testable import BookSeeker

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
                        let params = ListBooksUseCaseParams(title: "Dog")
                        self.useCase?.execute(input: params, completion: { response, error in
                            expect(response).toNot(beNil())
                            expect(error).to(beNil())
                            expect(response?.livros?.count).to(equal(1))
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
