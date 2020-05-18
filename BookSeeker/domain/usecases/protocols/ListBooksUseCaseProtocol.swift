import Foundation

public protocol ListBooksUseCaseProtocol: UseCaseProtocol where InputType == String, OutputType == [Book]? {
}
