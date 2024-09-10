//
//  MoreTVCell.swift
//  try
//
//  Created by 1234 on 05/09/2024.
//

import UIKit

class MoreTVCell: UITableViewCell {

    @IBOutlet weak var iconContainerView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var actionContainer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.setupIcons()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
    }
//    func setupIcons() {
//        // Clear existing subviews in iconContainerView
//        iconContainerView.subviews.forEach { $0.removeFromSuperview() }
//
//        let iconNames = ["favourites","Group", "help", "logout", "user"] // Names of images in Assets
//        for (index, iconName) in iconNames.enumerated() {
//            if let image = UIImage(named: iconName) {
//                let imageView = UIImageView(image: image)
//                imageView.contentMode = .scaleAspectFit
//                imageView.translatesAutoresizingMaskIntoConstraints = false
//                iconContainerView.addSubview(imageView)
//
//                // Layout constraints for each icon
//                NSLayoutConstraint.activate([
//                    imageView.topAnchor.constraint(equalTo: iconContainerView.topAnchor),
//                    imageView.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor),
//                    imageView.widthAnchor.constraint(equalToConstant: 22),
//                    imageView.heightAnchor.constraint(equalToConstant: 18)
//                ])
//
//                // Set the position of each icon
//                if index == 0 {
//                    // First icon - attach to the leading edge
//                    NSLayoutConstraint.activate([
//                        imageView.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor)
//                    ])
//                } else {
//                    // Subsequent icons - position relative to the previous icon
//                    let previousImageView = iconContainerView.subviews[index - 1] as! UIImageView
//                    NSLayoutConstraint.activate([
//                        imageView.leadingAnchor.constraint(equalTo: previousImageView.trailingAnchor, constant: 10) // Spacing between icons
//                    ])
//                }
//            }
//        }
//    }

    func configureCell (media: Media){
        let imageName = media.image
        self.iconContainerView.image = UIImage(named: imageName)
        self.wordLabel.text = media.title
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
