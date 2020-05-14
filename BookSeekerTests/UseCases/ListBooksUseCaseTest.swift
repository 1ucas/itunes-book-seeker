import Foundation
import Swinject
import XCTest

class ListBooksUseCaseTest: XCTestCase {

    var bookSeekerContainer: Container!
    var useCase: ListBooksUseCase!

    override func setUp() {
        bookSeekerContainer = BookSeekerContainer(mockRepository: true).container
        useCase = bookSeekerContainer.resolve(ListBooksUseCase.self)
    }

    override func tearDown() {
        bookSeekerContainer = nil
        useCase = nil
    }

    func testUseCaseWithSuccess() {
        useCase?.list(title: "Dog", completion: { books, error in
            XCTAssertNotNil(books)
            XCTAssertNil(error)
            XCTAssertEqual(books?.count, 1)
        })
    }

    func testUseCaseWithApiError() {
        useCase?.list(title: "Lucas", completion: { books, error in
            XCTAssertNotNil(error)
            XCTAssertNil(books)
        })
    }
}
