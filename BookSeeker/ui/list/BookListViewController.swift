import UIKit
import RxRelay
import RxSwift

class BookListViewController: BaseViewController<BookListViewModel, BookSeekerCoordinator> {

    @IBOutlet weak var tableView: UITableView!

    private var bookList: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        self.navigationController?.navigationBar.isHidden = false

        bindUI()

        viewModel.loadBooks()
    }

    private func bindUI() {
        viewModel.booksToDisplay.asObservable().skip(1).subscribe(onNext: { [unowned self] books in
            self.bookList = books
        }).disposed(by: viewModel.bag)
    }

}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.cellIdentifier)
                                                                                as? BookTableViewCell {
            let book = bookList[indexPath.row]

            let url = URL(string: book.image)
            let data = try? Data(contentsOf: url!)

            cell.imageBook.image = UIImage(data: data!)
            cell.lblTitle.text = book.title
            cell.lblDescription.text = book.description
            return cell
        } else {
            return UITableViewCell()
        }
    }

}
