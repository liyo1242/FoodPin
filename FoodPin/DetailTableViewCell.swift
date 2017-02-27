//
//  DetailTableViewCell.swift
//  FoodPin
//
//  Created by mmslab on 2017/2/20.
//  Copyright © 2017年 mmslab. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fieldLabel:UILabel!
    @IBOutlet weak var valueLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
