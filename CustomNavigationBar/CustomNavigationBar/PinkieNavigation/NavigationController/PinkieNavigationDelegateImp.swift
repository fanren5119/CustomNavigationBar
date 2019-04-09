//
//  PinkieNavigationDelegateImp.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieNavigationDelegateImp: NSObject & UINavigationControllerDelegate {
    
    var popTransition: PinkieNavPopTransitioning
    
    init(popTransition: PinkieNavPopTransitioning) {
        self.popTransition = popTransition
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        print("willShowViewController = \(animated)")
        

    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PinkiePushAnimatedTransitioning()
        case .pop:
            return PinkiePopAnimatedTransitioning()
        default:
            return nil
        }
    }

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.popTransition.isInteracting ? self.popTransition : nil
    }
}
