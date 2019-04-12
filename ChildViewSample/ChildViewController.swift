//
//  ChildViewController.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    init(with input: String) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
