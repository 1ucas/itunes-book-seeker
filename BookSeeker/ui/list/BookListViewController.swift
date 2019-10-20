import UIKit
import RxRelay
import RxSwift
import Kingfisher

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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.cellIdentifier)
                                                                                as? BookTableViewCell {
            let book = bookList[indexPath.row]

            cell.lblTitle.text = book.title

            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
            ]

            let attrStr = try? NSAttributedString(
                data: book.description.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: options,
                documentAttributes: nil
            )
            cell.lblDescription.attributedText = attrStr

            let image = UIImage(named: "AppIcon")

            cell.imageBook.kf.indicatorType = .activity
            cell.imageBook.kf.setImage(with: URL(string: book.image), placeholder: image)

            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = self.bookList[indexPath.row]
        self.coordinator.showBookDetail(book: book)
    }

}
