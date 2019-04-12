//
//  HorizontalCollectionViewController.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit
import SnapKit

class HorizontalCollectionViewController: UIViewController {

    // MARK: - Property
    
    private let outerInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    private let leftAndRightInset: CGFloat = 20
    private let heightOfCell: CGFloat      = 28
    private let cellMargin: CGFloat        = 10
    
    private lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollIndicatorInsets = outerInsets
        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: "SmallCell")
        collectionView.register(MiddleCell.self, forCellWithReuseIdentifier: "MiddleCell")
        collectionView.register(LargeCell.self, forCellWithReuseIdentifier: "LargeCell")
        return collectionView
    }()

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = outerInsets
        layout.itemSize = CGSize(width: 200, height: heightOfCell)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private var dataSource: [ItemType]
    
    // MARK: - Initializer
    
    init(with input: [ItemType]) {
        self.dataSource = input
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDataSource

extension HorizontalCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.row]
        let cell: BaseCell
        if item.width == ItemWidthType.small.rawValue {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCell", for: indexPath) as! BaseCell
        } else if item.width == ItemWidthType.middle.rawValue {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as! BaseCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LargeCell", for: indexPath) as! BaseCell
        }
        cell.update(at: indexPath.row,
                    text: item.text,
                    textColor: item.textColor,
                    canvasColor: item.canvasColor,
                    cornerColor: item.cornerColor)
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HorizontalCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: dataSource[indexPath.row].width.float, height: heightOfCell)
    }

    // 外枠のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return outerInsets
    }
    
    // 水平方向マージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellMargin
    }
}

extension HorizontalCollectionViewController: CellActionProtocol {
    func closeAction(at index: Int) {
        dataSource.remove(at: index)
        collectionView.reloadData()
    }
}
