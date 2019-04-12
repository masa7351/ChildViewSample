//
//  ViewController.swift
//  ChildViewSample
//
//  Created by Imai Masanao on 2019/04/11.
//  Copyright © 2019年 Imai Masanao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var childViewContainer: UIView!
    @IBOutlet weak var childSecondViewContainer: UIView!
    @IBOutlet weak var itemArea: UIView!
    @IBOutlet weak var horizontalCollectionContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let vc = ChildViewController(with: "ああああ")
        addViewController(vc, parentViewController: self, containerView: childViewContainer)

        let vc2 = ChildSecondViewController(with: "ああああ")
        addViewController(vc2, parentViewController: self, containerView: childSecondViewContainer)
        
        let item = Item.instantiate(text: "ああああああああああああああああああああ", width: .large)
        itemArea.addSubview(item)

        let vc3 = HorizontalCollectionViewController(with: "ああああああああああああああああああああ")
        addViewController(vc3, parentViewController: self, containerView: horizontalCollectionContainer)
    }
    
    func addViewController(_ viewController: UIViewController, parentViewController: UIViewController, containerView: UIView) {
        guard let subView = viewController.view else {
            return
        }
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        parentViewController.addChild(viewController)
        containerView.addSubview(subView)
        containerView.addConstraints([
            NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: subView, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: subView, attribute: .width, relatedBy: .equal, toItem: containerView, attribute: .width, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0),
            ])
        viewController.didMove(toParent: parentViewController)
    }
    
}

