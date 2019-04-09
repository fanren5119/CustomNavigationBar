//
//  PinkieViewController.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieViewController: UIViewController {
    
    var pinkieItem = PinkieNavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let nav = self.navigationController as! PinkieNavigationController
        let navigationView = nav.navigationView!
        if animated {
            navigationView.addNavigationItem(item: self.pinkieItem)
            return
        }
        navigationView.removeAllItems()
        let width = UIScreen.main.bounds.size.width
        if self.pinkieItem.navigationHidden {
            var rect = navigationView.frame
            rect.origin.x = width
            navigationView.frame = rect
        } else {
            var rect = navigationView.frame
            rect.origin.x = 0
            navigationView.frame = rect
            navigationView.addNavigationItem(item: self.pinkieItem)
        }
    }

}
