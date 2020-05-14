
import UIKit

protocol BaseViewControllerProtocol: UIViewController {
    func bindLoading()
    func configurarLoading()
    func showLoading()
    func hideLoading()
}

class BaseViewController<T:BaseViewModel, V:Coordinator>: UIViewController, BaseViewControllerProtocol, Storyboarded {
    
    var coordinator: V!
    var viewModel: T!
    var loading: LoadingViewController!
    
    private var showingLoading = false
    
    open override func viewDidLoad() {
        configurarLoading()
        bindLoading()
    }
    
    internal func bindLoading() {
        viewModel.showLoading.asObservable().skip(1).subscribe(onNext: {
            self.showLoading()
        }).disposed(by: viewModel.bag)
        
        viewModel.hideLoading.asObservable().skip(1).subscribe(onNext: {
            self.hideLoading()
        }).disposed(by: viewModel.bag)
    }
    
    internal func configurarLoading() {
        let storyboard = UIStoryboard(name: "Loading", bundle: Bundle(for: BaseViewController.self))
        loading = storyboard.instantiateViewController(withIdentifier: "LoadingViewController") as? LoadingViewController
        loading.view.alpha = 0.0
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        loading.modalPresentationStyle = .overFullScreen
        
    }
    
    internal func showLoading() {
        if !showingLoading {
            present(loading, animated: false, completion: nil)
            loading.view.alpha = 1.0
            loading.view.isUserInteractionEnabled = false
            loading.view.setNeedsDisplay()
            
            showingLoading = true
        }
    }
    
    internal func hideLoading() {
        if showingLoading {
            loading.view.alpha = 0.0
            loading.view.isUserInteractionEnabled = true
            loading.view.setNeedsDisplay()
            dismiss(animated: false, completion: nil)
            
            showingLoading = false
        }
    }

}
