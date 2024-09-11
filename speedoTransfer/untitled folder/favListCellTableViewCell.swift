import UIKit

class favListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var bankImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var accountNum: UILabel!
    @IBOutlet weak var editIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!

 
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            setupBankImage()
//            setupEditIcon()
//            setupDeleteIcon()
        }

        // Function to set up bankImage with rounded corners
        private func setupBankImage() {
            bankImage.layer.cornerRadius = bankImage.frame.size.height / 2
            bankImage.clipsToBounds = true
        }

        // Optionally configure icons with tap gestures or additional styling
//        private func setupEditIcon() {
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editIconTapped))
//            editIcon.addGestureRecognizer(tapGesture)
//            editIcon.isUserInteractionEnabled = true
//        }
//
//        private func setupDeleteIcon() {
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(deleteIconTapped))
//            deleteIcon.addGestureRecognizer(tapGesture)
//            deleteIcon.isUserInteractionEnabled = true
//        }

        // Configure cell with data from the model
        func configureCell(user: User) {
            UserName.text = user.name
            accountNum.text = user.accountNumber
            bankImage.image = UIImage(named: user.bankImageName)
        }

        // Action when edit icon is tapped
//        @objc private func editIconTapped() {
//            print("Edit icon tapped for user: \(userNameLabel.text ?? "")")
//        }
//
//        // Action when delete icon is tapped
//        @objc private func deleteIconTapped() {
//            print("Delete icon tapped for user: \(userNameLabel.text ?? "")")
//        }
    }
