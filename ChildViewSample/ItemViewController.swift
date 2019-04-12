//
//  ItemViewController.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/12.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

import UIKit
import SnapKit

class ItemsViewController: UIViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionViewLayout )
        // Cellに使われるクラスを登録.
        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: "SmallCell")
        collectionView.register(LargeCell.self, forCellWithReuseIdentifier: "LargeCell")
        collectionView.backgroundColor = UIColor.yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50)
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
    }
    
    private lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        // Cell一つ一つの大きさ.
        // layout.itemSize = CGSize(width:50, height:50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100)
        layout.scrollDirection = .horizontal
        return layout
    }()

    
    /*
     Cellが選択された際に呼び出される
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Num: \(indexPath.row)")
        
    }
}

extension ItemsViewController: UICollectionViewDataSource {
    /*
     Cellの総数を返す
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    /*
     Cellに値を設定する
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
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

extension ItemsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 3 == 0 {
            return CGSize(width: 50.0, height: 50.0)
        }
        return CGSize(width: 100.0, height: 50.0)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return margin
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
