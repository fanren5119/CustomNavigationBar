//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class ViewController: PinkieViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.pinkieItem.title = "你好"
        
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(respondsToButton), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func respondsToButton() {
        
        let firstVC = FirstViewController()
        self.navigationController?.pushViewController(firstVC, animated: true)
    }

}

