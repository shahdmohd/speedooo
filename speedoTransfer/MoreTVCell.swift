//
//  MoreTVCell.swift
//  try
//
//  Created by 1234 on 05/09/2024.
//

import UIKit
protocol MoreTVCellDelegate: AnyObject {
    func didTapCell(_ cell: MoreTVCell)
}
class MoreTVCell: UITableViewCell {

    @IBOutlet weak var iconContainerView: UIImageView!
   
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var actionContainer: UIImageView!
    
    weak var delegate: MoreTVCellDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.setupIcons()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        // Add a tap gesture recognizer to the cell
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(whenTapped))
                self.addGestureRecognizer(tapGesture)
    }


    func configureCell (media: Media){
        let imageName = media.image
        self.iconContainerView.image = UIImage(named: imageName)
        self.wordLabel.text = media.title
    }

 @objc func whenTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didTapCell(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


}

