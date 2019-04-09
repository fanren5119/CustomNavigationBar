//
//  PinkiePushChageNavAnimation.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkiePushChangeNavAnimation: PinkieNavPushAnimation {

    var navigationView: PinkieNavigationView?
    
    override func navigationViewPerpare() {
        let nav = self.fromVC.navigationController as? PinkieNavigationController
        self.navigationView = nav?.navigationView
        self.navigationView?.addNavigationItem(item: self.toPinkieVC?.pinkieItem)
        
        
        var toTitleCenter = self.toPinkieVC?.pinkieItem.titleLabel?.center ?? CGPoint(x: 0, y: 0)
        toTitleCenter.x = self.screenWidth / 2
        self.toPinkieVC?.pinkieItem.titleLabel?.center = toTitleCenter
        self.toPinkieVC?.pinkieItem.titleLabel?.alpha = 0
        self.toPinkieVC?.pinkieItem.leftBarButtonItem?.getBarButtonView().alpha = 0
        self.toPinkieVC?.pinkieItem.rightBarButtonItem?.getBarButtonView().alpha = 0
        
        var fromTitleCenter = self.fromPinkieVC?.pinkieItem.titleLabel?.center ?? CGPoint(x: 0, y: 0)
        fromTitleCenter.x =  self.screenWidth / 2
        self.fromPinkieVC?.pinkieItem.titleLabel?.center = fromTitleCenter
        self.fromPinkieVC?.pinkieItem.titleLabel?.alpha = 1
        self.fromPinkieVC?.pinkieItem.leftBarButtonItem?.getBarButtonView().alpha = 1
        self.fromPinkieVC?.pinkieItem.rightBarButtonItem?.getBarButtonView().alpha = 1
    }
    
    override func naviationViewAnimate() {
        
        self.toPinkieVC?.pinkieItem.titleLabel?.alpha = 1
        self.toPinkieVC?.pinkieItem.leftBarButtonItem?.getBarButtonView().alpha = 1
        self.toPinkieVC?.pinkieItem.rightBarButtonItem?.getBarButtonView().alpha = 1
        
        var fromTitleCenter = self.fromPinkieVC?.pinkieItem.titleLabel?.center ?? CGPoint(x: 0, y: 0)
        fromTitleCenter.x =  30;
        self.fromPinkieVC?.pinkieItem.titleLabel?.center = fromTitleCenter
        self.fromPinkieVC?.pinkieItem.titleLabel?.alpha = 0
        self.fromPinkieVC?.pinkieItem.leftBarButtonItem?.getBarButtonView().alpha = 0
        self.fromPinkieVC?.pinkieItem.rightBarButtonItem?.getBarButtonView().alpha = 0
    }
    
    override func navigationViewAnimateComplete(cancel: Bool) {
        
        if (cancel) {
            self.fromPinkieVC?.pinkieItem.titleLabel?.alpha = 1
            self.fromPinkieVC?.pinkieItem.leftBarButtonItem?.getBarButtonView().alpha = 1
            self.fromPinkieVC?.pinkieItem.rightBarButtonItem?.getBarButtonView().alpha = 1
            self.navigationView?.removeNavigationItem(item: self.toPinkieVC?.pinkieItem)
        } else {
            self.navigationView?.removeNavigationItem(item: self.fromPinkieVC?.pinkieItem)
        }
        
    }
    
}
