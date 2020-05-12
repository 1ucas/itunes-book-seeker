import Foundation

public protocol ListBooksUseCaseProtocol {

    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void)
}
