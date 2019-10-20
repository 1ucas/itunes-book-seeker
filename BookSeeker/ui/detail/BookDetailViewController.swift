import UIKit
import RxSwift
import Kingfisher

class BookDetailViewController: BaseViewController<BookDetailViewModel, BookSeekerCoordinator> {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var imgCover: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()

        viewModel.loadBookDetails()
    }

    func bindUI() {
        viewModel.loadedBook.asObservable().skip(1).subscribe(onNext: { [unowned self] book in
            if let book = book {
                let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                    NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                    NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
                ]

                let attrStr = try? NSAttributedString(
                    data: (book.description.data(using: String.Encoding.unicode, allowLossyConversion: true)!),
                    options: options,
                    documentAttributes: nil
                )

                self.lblTitle.text = book.title
                self.lblAuthor.text = book.author
                self.lblDescription.attributedText = attrStr
                self.lblRating.text = "\(book.rating)"
                self.imgCover.kf.setImage(with: URL(string: book.image), placeholder: UIImage(named: "AppIcon"))
            }
        }).disposed(by: viewModel.bag)
    }

}
