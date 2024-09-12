//
//  moreProfileCell.swift
//  try
//
//  Created by 1234 on 12/09/2024.
//

import UIKit

protocol settingCellDelegate: AnyObject {
    func didTapcells(_ cell: settingCell)
}


class settingCell: UITableViewCell {

    
    weak var delegate: settingCellDelegate?
    @IBOutlet weak var navIcon: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(whenmoresetTapped))
        self.addGestureRecognizer(tapGesture)
    }

    
    func configureCell (labels: Labels){
        let imageName = labels.image
        self.navIcon.image = UIImage(named: imageName)
        self.firstLabel.text = labels.title
        self.secondLabel.text = labels.subLabel
    }
    
    @objc func whenmoresetTapped(_ sender: UITapGestureRecognizer) {
           delegate?.didTapcells(self)
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
