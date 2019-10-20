import UIKit
import RxSwift

class BookSearchViewController: BaseViewController<BookSearchViewModel> {

    private var timer: Timer?

    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var userSearches: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookSearchBar.searchBarStyle = .minimal
        self.bookSearchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        getLastSearches()
        bindUI()
    }

    private func getLastSearches() {
        if let userSearches = UserDefaults.standard.array(forKey: "searches") {
            for search in userSearches {
                self.userSearches.append(String.fromAny(object: search))
            }
        }
        self.tableView.reloadData()
    }

    private func bindUI() {
        viewModel.booksToDisplay.asObservable().skip(1).subscribe(onNext: { [unowned self] _ in
            self.recordSearch(self.bookSearchBar.text!)
            self.tableView.reloadData()
        }).disposed(by: viewModel.bag)
    }

    private func recordSearch(_ text: String) {
        userSearches.insert(text, at: 0)

        if let searches = UserDefaults.standard.array(forKey: "searches") {
            var newSearches = searches
            newSearches.insert(text, at: 0)
            UserDefaults.standard.set(newSearches, forKey: "searches")
            UserDefaults.standard.synchronize()
        } else {
            let firstSearch = [text]
            UserDefaults.standard.set(firstSearch, forKey: "searches")
            UserDefaults.standard.synchronize()
        }
    }

}

extension BookSearchViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.userSearches.count > 5 {
            return 5
        } else {
            return self.userSearches.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = UITableViewCell()
        bookCell.textLabel?.text = self.userSearches[indexPath.row]
        return bookCell
    }

}

extension BookSearchViewController: UISearchBarDelegate {

    @objc private func searchBarTextDidEndEditing(timer: Timer) {
        let searchBar = timer.userInfo as? UISearchBar
        let title = searchBar!.text!
        if title.count >= 3 {
            view.endEditing(true)
            viewModel.listBooks(title: title)
        }
    }

    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self, selector: #selector(self.searchBarTextDidEndEditing),
                                     userInfo: searchBar, repeats: false)
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
