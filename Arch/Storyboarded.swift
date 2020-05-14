
import UIKit

protocol Storyboarded {
    static var identifiable: String { get }
    static var storyboard: UIStoryboard { get }
    static func instantiate<V: BaseViewModel, C: Coordinator>(viewModel: V, coordinator: C) -> Self
}

extension Storyboarded where Self: BaseViewControllerProtocol {
    static var identifiable: String {
        String(describing: self)
    }
    
    static var storyboard: UIStoryboard {
        let storyboardName = identifiable.replacingOccurrences(of: "ViewController", with: "")
        let bundle = Bundle(for: self)
        
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }
    
    static func instantiate<V: BaseViewModel, C: Coordinator>(viewModel: V, coordinator: C) -> Self {
        let viewController = storyboard.instantiateViewController(withIdentifier: identifiable) as! BaseViewController<V, C>
        viewController.viewModel = viewModel
        viewController.coordinator = coordinator
        
        return viewController as! Self
    }
}
