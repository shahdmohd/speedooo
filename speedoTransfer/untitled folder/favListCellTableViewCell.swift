//
//  favListCellTableViewCell.swift
//  speedoTransfer
//
//  Created by 1234 on 11/09/2024.
//

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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
