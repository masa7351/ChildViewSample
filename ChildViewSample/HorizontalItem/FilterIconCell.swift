//
//  CustomCell.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/12.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

protocol FilterIconActionProtocol: class {
    func closeAction(at index: Int)
}

protocol FilterIconProtocol {
    var width: Int {get}
    var text: String {get}
    var canvasColor: UIColor {get}
    var textColor: UIColor {get}
    var cornerColor: UIColor {get}
}

enum FilterIconWidthType: Int {
    case small  = 128
    case middle = 141
    case large  = 160
}

internal final class FilterIconSmallCell: FilterIconCell {
    override var contentWidth: CGFloat {
        return FilterIconWidthType.small.rawValue.float
    }
}

internal final class FilterIconMiddleCell: FilterIconCell {
    override var contentWidth: CGFloat {
        return FilterIconWidthType.middle.rawValue.float
    }
}

internal final class FilterIconLargeCell: FilterIconCell {
    override var contentWidth: CGFloat {
        return FilterIconWidthType.large.rawValue.float
    }
}

/// フィルターIcon用のベースクラス
internal class FilterIconCell: UICollectionViewCell {
    var index: Int?
    var textLabel: UILabel!
    var closeButton: UIButton!
    var outerBorderLayer: CALayer!
    weak var delegate: FilterIconActionProtocol?
    var contentWidth: CGFloat {
        return FilterIconWidthType.small.rawValue.float
    }

    // MARK: - Initializer
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.layer.cornerRadius = 10
        self.contentView.backgroundColor = UIColor.white

        // text
        textLabel = UILabel(frame: CGRect.zero)
        textLabel.text = ""
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(textLabel!)
        textLabel!.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.contentView)
            make.left.right.equalTo(self.contentView).inset(20)
        }
        
        // close button
        closeButton = UIButton(frame: CGRect.zero)
        closeButton.setTitle("×", for: .normal)
        self.contentView.addSubview(closeButton!)
        closeButton!.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).inset(0)
        }
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)

        // outer border
        outerBorderLayer = CALayer()
        outerBorderLayer.borderWidth = 1
        outerBorderLayer.cornerRadius = contentView.layer.cornerRadius
        outerBorderLayer.frame = bounds
        self.contentView.layer.addSublayer(outerBorderLayer)
    }
    
    @objc func didTapClose(_ sender: UIButton) {
        guard let index = index else {
            return
        }
        delegate?.closeAction(at: index)
    }
    
    func update(at index: Int, text: String, textColor: UIColor, canvasColor: UIColor, cornerColor: UIColor) {
        self.index = index
        textLabel.text = text
        outerBorderLayer.borderColor = cornerColor.cgColor
        textLabel.textColor = textColor
        closeButton.setTitleColor(textColor, for: .normal)
        contentView.backgroundColor = canvasColor
    }

}

extension Int {
    public var float: CGFloat {
        return CGFloat(self)
    }
}
