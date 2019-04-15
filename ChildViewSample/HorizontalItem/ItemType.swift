//
//  ItemType.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

enum ItemType {
    case text1
    case text2
    case text3
    case text4
    case text5
    case text6
    case text7
}

extension ItemType: FilterIconProtocol {

    private struct ItemValues {
        var width: Int
        var text: String
        var textColor: UIColor
        var canvasColor: UIColor
        var cornerColor: UIColor
    }
    
    private var itemValues: ItemValues {
        switch self {
        case .text1:
            return ItemValues(width: FilterIconWidthType.small.rawValue,
                              text: "テキスト1",
                              textColor: UIColor.black,
                              canvasColor: UIColor.white,
                              cornerColor: UIColor.white)
        case .text2:
            return ItemValues(width: FilterIconWidthType.middle.rawValue,
                              text: "テキスト2aaaaa",
                              textColor: UIColor.black,
                              canvasColor: UIColor.white,
                              cornerColor: UIColor.purple)
        case .text3:
            return ItemValues(width: FilterIconWidthType.large.rawValue,
                              text: "テキスト3bbbbb",
                              textColor: UIColor.black,
                              canvasColor: UIColor.green,
                              cornerColor: UIColor.green)
        case .text4:
            return ItemValues(width: FilterIconWidthType.large.rawValue,
                              text: "テキスト4bbbbb",
                              textColor: UIColor.white,
                              canvasColor: UIColor.red,
                              cornerColor: UIColor.red)
        case .text5:
            return ItemValues(width: FilterIconWidthType.large.rawValue,
                              text: "テキスト5bbbbb",
                              textColor: UIColor.black,
                              canvasColor: UIColor.green,
                              cornerColor: UIColor.green)
        case .text6:
            return ItemValues(width: FilterIconWidthType.large.rawValue,
                              text: "テキスト6bbbbb",
                              textColor: UIColor.white,
                              canvasColor: UIColor.green,
                              cornerColor: UIColor.green)
        case .text7:
            return ItemValues(width: FilterIconWidthType.large.rawValue,
                              text: "テキスト7bbbbb",
                              textColor: UIColor.white,
                              canvasColor: UIColor.green,
                              cornerColor: UIColor.blue)

        }
    }
    
    var width: Int {
        return itemValues.width
    }
    
    var text: String {
        return itemValues.text
    }
    
    var canvasColor: UIColor {
        return itemValues.canvasColor
    }
    
    var textColor: UIColor {
        return itemValues.textColor
    }
    
    var cornerColor: UIColor {
        return itemValues.cornerColor
    }
}
