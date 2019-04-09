//
//  PinkieNavigationController.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieNavigationController: UINavigationController {
    
    var navigationView: PinkieNavigationView?
    let popTransition = PinkieNavPopTransitioning()
    var delegateImp: PinkieNavigationDelegateImp?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.isNavigationBarHidden = true
        
        self.setupDelegateImp()
        self.setupUI()
    }
    
    func setupDelegateImp() {
        self.popTransition.navigationController = self
        
        self.delegateImp = PinkieNavigationDelegateImp(popTransition: self.popTransition)
        self.delegate = self.delegateImp
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setupUI() {
        self.setupNavigationView()
    }

    
    func setupNavigationView() {
        let height = 64.0
        let width = self.view.frame.width
        let rect = CGRect(x: 0.0, y: 0.0, width: Double(width), height: height)
        self.navigationView = PinkieNavigationView(frame: rect)
        self.navigationView?.backgroundColor = UIColor.red
        self.view.addSubview(self.navigationView!)
    }
}
