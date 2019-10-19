import UIKit

class BookSearchViewController: BaseViewController {

    @IBOutlet weak var bookSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookSearchBar.searchBarStyle = .minimal
    }

}
