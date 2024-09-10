import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize UILabel
        titleLabel.font = UIFont(name: "Inter", size: 32)
        titleLabel.textColor = .white

        // Customize UIView
        mainView.layer.cornerRadius = 40
        mainView.backgroundColor = UIColor(red: 0.32, green: 0.07, blue: 0.13, alpha: 1.0)
    }
}
