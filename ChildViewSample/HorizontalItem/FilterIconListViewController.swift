//
//  FilterIconListViewController.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit
import SnapKit

protocol FilterIconListViewControllerDelegate: class {
    func refreshDataSource(dataSource: [FilterIconProtocol])
}

class FilterIconListViewController: UIViewController {

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
        collectionView.register(FilterIconSmallCell.self, forCellWithReuseIdentifier: "FilterIconSmallCell")
        collectionView.register(FilterIconMiddleCell.self, forCellWithReuseIdentifier: "FilterIconMiddleCell")
        collectionView.register(FilterIconLargeCell.self, forCellWithReuseIdentifier: "FilterIconLargeCell")
        return collectionView
    }()

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = outerInsets
        layout.itemSize = CGSize(width: 200, height: heightOfCell)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    weak var delegate: FilterIconListViewControllerDelegate?
    
    private var dataSource: [FilterIconProtocol]
    
    // MARK: - Initializer
    
    init(with input: [FilterIconProtocol]) {
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

extension FilterIconListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.row]
        let cell: FilterIconCell
        if item.width == FilterIconWidthType.small.rawValue {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterIconSmallCell", for: indexPath) as! FilterIconCell
        } else if item.width == FilterIconWidthType.middle.rawValue {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterIconMiddleCell", for: indexPath) as! FilterIconCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterIconLargeCell", for: indexPath) as! FilterIconCell
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

extension FilterIconListViewController: UICollectionViewDelegateFlowLayout {
    
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

// MARK: - FilterIconActionProtocol

extension FilterIconListViewController: FilterIconActionProtocol {
    func closeAction(at index: Int) {
        dataSource.remove(at: index)
        delegate?.refreshDataSource(dataSource: dataSource)
        collectionView.reloadData()
    }
}
