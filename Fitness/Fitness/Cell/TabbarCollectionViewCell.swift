//
//  TabbarCollectionViewCell.swift
//  Fitness
//
//  Created by Duc'sMacBook on 6/30/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import UIKit

class TabbarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var NameTabLb: UILabel!
    
    
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.2, y: 1.2) : CGAffineTransform.identity
                self.NameTabLb.textColor = self.isSelected ? UIColor.black : .lightGray
            }, completion: nil)
            
        }
    }
}
