
import UIKit

protocol Storyboarded {
    static var identifier: String { get }
    static var storyboard: UIStoryboard { get }
    static func instantiate<V: BaseViewModel, C: Coordinator>(viewModel: V, coordinator: C) -> Self
}

extension Storyboarded where Self: UIViewController {
    static var identifier: String {
        String(describing: self)
    }
    
    static var storyboard: UIStoryboard {
        let storyboardName = identifier.replacingOccurrences(of: "ViewController", with: "")
        let bundle = Bundle(for: self)
        
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }
    
    static func instantiate<V: BaseViewModel, C: Coordinator>(viewModel: V, coordinator: C) -> Self {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? BaseViewController<V, C> else {
            fatalError("Failed to instantiate \(identifier)<\(String(describing: viewModel)), \(String(describing: coordinator))>")
        }
        viewController.viewModel = viewModel
        viewController.coordinator = coordinator
        
        return viewController as! Self
    }
}
