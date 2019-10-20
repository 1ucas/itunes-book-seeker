
import Foundation
import RxRelay
import RxSwift

class BaseViewModel {
    
    var showLoading = BehaviorRelay<Void>(value: ())
    var hideLoading = BehaviorRelay<Void>(value: ())
    let bag = DisposeBag()
    
}
