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


    func configureCell (media: Media){
        let imageName = media.image
        self.iconContainerView.image = UIImage(named: imageName)
        self.wordLabel.text = media.title
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


}

