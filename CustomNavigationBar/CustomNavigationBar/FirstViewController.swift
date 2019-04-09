//
//  FirstViewController.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class FirstViewController: PinkieViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.green
        self.pinkieItem.title = "first"
//        self.pinkieItem.navigationHidden = true
        weak var weakSelf = self
        self.pinkieItem.leftBarButtonItem = PinkieItemFactory.barButtonItem(image: "icon_back", actionBlock: {
            weakSelf?.navigationController?.popViewController(animated: true)
        })
        
        self.pinkieItem.rightBarButtonItem = PinkieItemFactory.barButtonItem(title: "完成", actionBlock: {
            print("完成")
        })
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(respondsToButton), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        let button2 = UIButton(type: .custom)
        button2.frame = CGRect(x: 150, y: 100, width: 100, height: 100)
        button2.backgroundColor = UIColor.black
        button2.addTarget(self, action: #selector(respondsToButton2), for: .touchUpInside)
        self.view.addSubview(button2)
    }

    @objc func respondsToButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func respondsToButton2() {
        
        let firstVC = SecondViewController()
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
}
