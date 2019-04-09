//
//  PinkiePushHideNavAnimation.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkiePushHideNavAnimation: PinkieNavPushAnimation {

    var navigationView: PinkieNavigationView?
    
    override func navigationViewPerpare() {
        let nav = self.fromVC.navigationController as? PinkieNavigationController
        self.navigationView = nav?.navigationView
        
        var rect = self.navigationView?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        rect.origin.x = 0
        self.navigationView?.frame = rect
    }
    
    override func naviationViewAnimate() {
        
        var rect = self.navigationView?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        rect.origin.x = -self.screenWidth
        self.navigationView?.frame = rect
    }
    
    override func navigationViewAnimateComplete(cancel: Bool) {
        
        var rect = self.navigationView?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        if (cancel) {
            rect.origin.x = 0
            self.navigationView?.frame = rect
        } else {
            self.navigationView?.removeNavigationItem(item: self.fromPinkieVC?.pinkieItem)
        }
        
    }
    
}
