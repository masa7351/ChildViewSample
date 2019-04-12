//
//  CustomCollectionViewCell.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/12.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

protocol CellDisplayable: AnyObject {
    var textLabel : UILabel? {get set}
    func configureTextLabel(width: CGFloat, color: UIColor)
}

extension CellDisplayable {
    func configureTextLabel(width: CGFloat, color: UIColor) {
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:50))
        textLabel?.text = "nil"
        textLabel?.backgroundColor = color
        textLabel?.textAlignment = NSTextAlignment.center
    }
}

class LargeCell: UICollectionViewCell, CellDisplayable {
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextLabel(width: 100, color: UIColor.blue)
        self.contentView.addSubview(textLabel!)
    }
    
}


class SmallCell: UICollectionViewCell, CellDisplayable {
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextLabel(width: 50, color: UIColor.green)
        self.contentView.addSubview(textLabel!)
    }
    
}
