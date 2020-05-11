
import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}


public extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboardName = id.replacingOccurrences(of: "ViewController", with: "")
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
