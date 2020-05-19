import Foundation
import Swinject
import XCTest

@testable import BookSeeker

class ListBooksUseCaseTest: XCTestCase {

    var useCase: ListBooksUseCase!

    override func setUp() {
        useCase = ListBooksUseCase(repository: BookMockRepository())
    }

    override func tearDown() {
        useCase = nil
    }

    func testUseCaseWithSuccess() {
        let params = ListBooksUseCaseParams(title: "Dog")
        useCase?.execute(input: params, completion: { response, error in
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            XCTAssertEqual(response?.livros?.count, 1)
        })
    }

    func testUseCaseWithApiError() {
        let params = ListBooksUseCaseParams(title: "Lucas")
        useCase?.execute(input: params, completion: { response, error in
            XCTAssertNotNil(error)
            XCTAssertNil(response)
        })
    }
}
