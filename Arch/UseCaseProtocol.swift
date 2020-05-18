import Foundation

public protocol UseCaseProtocol {
    associatedtype InputType
    associatedtype OutputType
    
    func execute(input: InputType, completion: @escaping (OutputType, ApiErrorResponse?) -> Void)
}
