
import UIKit

class BaseViewController<T:BaseViewModel>: UIViewController, Storyboarded {

    var coordinator: Coordinator!
    var viewModel: T!
    var loading: LoadingViewController!
    
    private var showingLoading = false
    
    open override func viewDidLoad() {
        configurarLoading()
        bindLoading()
    }
    
    private func bindLoading() {
        viewModel.showLoading.asObservable().skip(1).subscribe(onNext: {
            self.showLoading()
        }).disposed(by: viewModel.bag)
        
        viewModel.hideLoading.asObservable().skip(1).subscribe(onNext: {
            self.hideLoading()
        }).disposed(by: viewModel.bag)
    }
    
    private func configurarLoading() {
        let storyboard = UIStoryboard(name: "Loading", bundle: Bundle(for: BaseViewController.self))
        loading = storyboard.instantiateViewController(withIdentifier: "LoadingViewController") as? LoadingViewController
        loading.view.alpha = 0.0
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        loading.modalPresentationStyle = .overFullScreen
        
    }
    
    private func showLoading() {
        if !showingLoading {
            present(loading, animated: false, completion: nil)
            loading.view.alpha = 1.0
            loading.view.isUserInteractionEnabled = false
            loading.view.setNeedsDisplay()
            
            showingLoading = true
        }
    }
    
    private func hideLoading() {
        if showingLoading {
            loading.view.alpha = 0.0
            loading.view.isUserInteractionEnabled = true
            loading.view.setNeedsDisplay()
            dismiss(animated: false, completion: nil)
            
            showingLoading = false
        }
    }

}
