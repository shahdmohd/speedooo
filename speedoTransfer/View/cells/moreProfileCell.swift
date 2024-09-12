//
//  moreProfileCell.swift
//  try
//
//  Created by 1234 on 12/09/2024.
//

import UIKit

protocol profileCellDelegate: AnyObject {
    func didTapcell(_ cell: moreProfileCell)
}


class moreProfileCell: UITableViewCell {
    @IBOutlet weak var navIcon: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    
    weak var delegate: profileCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(whenmoreProfTapped))
        self.addGestureRecognizer(tapGesture)
    }

    
    func configureCell (labels: Labels){
        let imageName = labels.image
        self.iconImage.image = UIImage(named: imageName)
        self.firstLabel.text = labels.title
        self.secondLabel.text = labels.subLabel
    }
    
    @objc func whenmoreProfTapped(_ sender: UITapGestureRecognizer) {
           delegate?.didTapcell(self)
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
