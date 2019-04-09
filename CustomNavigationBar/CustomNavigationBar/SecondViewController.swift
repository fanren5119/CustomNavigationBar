//
//  SecondViewController.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class SecondViewController: PinkieViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pinkieItem.title = "second"
        weak var weakSelf = self
        self.pinkieItem.leftBarButtonItem = PinkieItemFactory.barButtonItem(image: "icon_back", actionBlock: {
            weakSelf?.navigationController?.popViewController(animated: true)
        })

        self.pinkieItem.rightBarButtonItem = PinkieItemFactory.barButtonItem(title: "保存", actionBlock: {
            print("保存")
        })
        
        self.view.backgroundColor = UIColor.blue
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(respondsToButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    

    @objc func respondsToButton() {
        
        self.navigationController?.popViewController(animated: true)
    }

}
