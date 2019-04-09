//
//  PinkieNavPushAnimation.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieNavPushAnimation: NSObject {

    var Duration: Double = 0.2
    var fromVC: UIViewController
    var toVC: UIViewController
    
    var fromPinkieVC: PinkieViewController?
    var toPinkieVC: PinkieViewController?
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    static func create(fromVC: UIViewController, toVC: UIViewController, duration: Double) -> PinkieNavPushAnimation {

        let fromPinkieVC = self.animateVC(vc: fromVC) as? PinkieViewController
        let toPinkieVC = self.animateVC(vc: toVC) as? PinkieViewController
        
        let fromNavHide = fromPinkieVC?.pinkieItem.navigationHidden ?? false
        let toNavHide = toPinkieVC?.pinkieItem.navigationHidden ?? false
        
        var pushAnimation: PinkieNavPushAnimation!
        if !fromNavHide && !toNavHide {
            pushAnimation = PinkiePushChangeNavAnimation(fromVC: fromVC, toVC: toVC, duration: duration)
        }
        if !fromNavHide && toNavHide {
            pushAnimation = PinkiePushHideNavAnimation(fromVC: fromVC, toVC: toVC, duration: duration)
        }
        if fromNavHide && !toNavHide {
            pushAnimation = PinkiePushShowNavAnimation(fromVC: fromVC, toVC: toVC, duration: duration)
        }
        if fromNavHide && toNavHide {
            pushAnimation = PinkieNavPushAnimation(fromVC: fromVC, toVC: toVC, duration: duration)
        }
        
        pushAnimation.fromPinkieVC = fromPinkieVC
        pushAnimation.toPinkieVC = toPinkieVC
        return pushAnimation
    }
    
    static func animateVC(vc: UIViewController?) -> UIViewController? {
        if let vc = vc as? UITabBarController {
            return vc.selectedViewController
        }
        return vc
    }
    
    init(fromVC: UIViewController, toVC: UIViewController, duration: Double) {
        self.fromVC = fromVC
        self.toVC = toVC
        self.Duration = duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
        self.viewAnimatePrepare(context: transitionContext)
        self.navigationViewPerpare()
        
        UIView.animate(withDuration: Duration, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.viewAnimation()
            self.naviationViewAnimate()
            
        }) { _ in
            let cancel = transitionContext.transitionWasCancelled
            if cancel {
                self.toVC.view.removeFromSuperview()
            } else {
                self.fromVC.view.removeFromSuperview()
            }
            self.navigationViewAnimateComplete(cancel: cancel)
            transitionContext.completeTransition(!cancel)
        }
    }
    
    func viewAnimatePrepare(context: UIViewControllerContextTransitioning) {
        
        context.containerView.addSubview(self.toVC.view)
        self.toVC.view.frame = context.containerView.bounds
        
        var rect = self.toVC.view.frame
        rect.origin.x = screenWidth
        self.toVC.view.frame = rect
    }
    
    func viewAnimation() {
        var fromRect = self.fromVC.view.frame
        fromRect.origin.x = -screenWidth
        self.fromVC.view.frame = fromRect
        
        var toRect = self.toVC.view.frame
        toRect.origin.x = 0
        self.toVC.view.frame = toRect
    }
    
    func navigationViewPerpare() {
        
    }
    
    func naviationViewAnimate() {
        
    }
    
    func navigationViewAnimateComplete(cancel: Bool) {
        
    }
}
