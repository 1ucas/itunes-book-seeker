
import Foundation
import RxRelay
import RxSwift

class BaseViewModel {
    
    var showLoading = PublishRelay<Void>()
    var hideLoading = PublishRelay<Void>()
    let bag = DisposeBag()
    
}
