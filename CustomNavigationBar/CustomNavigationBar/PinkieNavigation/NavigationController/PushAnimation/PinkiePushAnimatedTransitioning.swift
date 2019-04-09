//
//  PinkiePushAnimatedTransitioning.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkiePushAnimatedTransitioning: NSObject & UIViewControllerAnimatedTransitioning {
    
    let Duration: Double = 0.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let animate = PinkieNavPushAnimation.create(fromVC: fromVC!, toVC: toVC!, duration: Duration)
        animate.animateTransition(using: transitionContext)
    }
}
