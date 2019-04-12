//
//  Item.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

protocol ItemClearable: class {
    func clearItem(itemNumber: Int)
}

class Item: UIView {

    enum Width: Int {
        case small  = 128
        case middle = 141
        case large  = 160
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    private var itemNumber: Int = 0
    
    private(set) var width: Width = .small
    
    weak var delegate: ItemClearable?
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        delegate?.clearItem(itemNumber: self.itemNumber)
    }
    
    static func instantiate(text: String, width: Item.Width) -> Item {
        let view =  UINib(nibName: "Item", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! Item
        view.width = width
        view.textLabel.text = text
        view.frame = CGRect(x: 0, y: 0, width: CGFloat(width.rawValue), height: view.frame.height)
        view.layer.cornerRadius = 10
        return view
    }
}
