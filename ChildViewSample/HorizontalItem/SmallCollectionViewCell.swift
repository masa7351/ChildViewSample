//
//  SmallCollectionViewCell.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/12.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        print("aaaaa")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
