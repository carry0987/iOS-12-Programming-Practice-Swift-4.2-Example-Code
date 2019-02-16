//
//  MyCell.swift
//  CustomCell
//
//  Created by KoKang Chu on 2017/8/26.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
