//
//  PhongTapTableViewCell.swift
//  Fitness
//
//  Created by Duc'sMacBook on 7/3/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit

class PhongTapTableViewCell: UITableViewCell {

    @IBOutlet weak var tenLb: UILabel!
    @IBOutlet weak var danhGiaLb: UILabel!
    @IBOutlet weak var diaChiLb: UILabel!
    @IBOutlet weak var gioMoCuaLb: UILabel!
    @IBOutlet weak var imageImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
