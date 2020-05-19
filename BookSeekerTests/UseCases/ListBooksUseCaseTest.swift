import Foundation
import Swinject
import XCTest

class ListBooksUseCaseTest: XCTestCase {

    var useCase: ListBooksUseCase!

    override func setUp() {
        useCase = ListBooksUseCase(repository: BookMockRepository())
    }

    override func tearDown() {
        useCase = nil
    }

    func testUseCaseWithSuccess() {
        useCase?.execute(input: "Dog", completion: { books, error in
            XCTAssertNotNil(books)
            XCTAssertNil(error)
            XCTAssertEqual(books?.count, 1)
        })
    }

    func testUseCaseWithApiError() {
        useCase?.execute(input: "Lucas", completion: { books, error in
            XCTAssertNotNil(error)
            XCTAssertNil(books)
        })
    }
}
