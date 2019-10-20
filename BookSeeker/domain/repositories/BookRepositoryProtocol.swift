import Foundation

protocol BookRepositoryProtocol {

    func list(title: String, completion: @escaping ([Book]?, ApiErrorResponse?) -> Void )

}
