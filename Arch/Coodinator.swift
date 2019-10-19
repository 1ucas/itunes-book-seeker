
import UIKit

public protocol Coordinator {
    var currentNavigationController : UINavigationController! { get set }
    
    func start(navigationController: UINavigationController)
}

