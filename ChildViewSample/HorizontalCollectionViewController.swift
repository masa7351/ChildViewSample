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
    
    private var defaultOuterInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    private let sideInset: CGFloat = 20

    private lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = defaultOuterInsets
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    // MARK: - Initializer
    
    init(with input: String) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(view)
        }
        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: "SmallCell")
        collectionView.register(LargeCell.self, forCellWithReuseIdentifier: "LargeCell")
        collectionView.scrollIndicatorInsets = defaultOuterInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

}

extension HorizontalCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 3 == 0 {
            let cell : SmallCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCell", for: indexPath) as! SmallCell
            cell.textLabel?.text = indexPath.row.description
            return cell
        } else {
            let cell : LargeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LargeCell", for: indexPath) as! LargeCell
            cell.textLabel?.text = indexPath.row.description
            return cell
        }
    }

}

extension HorizontalCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 3 == 0 {
            return CGSize(width: 50.0, height: 50.0)
        }
        return CGSize(width: 100.0, height: 50.0)
    }

    // 外枠のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return defaultOuterInsets
    }
    
//    // 垂直方向マージン
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return margin
//    }
    
    // 水平方向マージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
