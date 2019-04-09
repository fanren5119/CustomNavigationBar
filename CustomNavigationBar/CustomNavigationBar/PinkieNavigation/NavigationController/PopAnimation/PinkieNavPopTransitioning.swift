//
//  PinkieNavPopAnimation.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieNavPopTransitioning: UIPercentDrivenInteractiveTransition {
    
    var isInteracting = false
    var navigationController: PinkieNavigationController? {
        didSet {
            if let nav = navigationController {
                let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(respondsToGesture(gesture:)))
                gesture.edges = UIRectEdge.left
                nav.view.addGestureRecognizer(gesture)
            }
        }
    }

    @objc func respondsToGesture(gesture: UIGestureRecognizer) {
     
        let point = gesture.location(in: gesture.view)
        let screenWidth = UIScreen.main.bounds.size.width
        let scale = point.x / screenWidth
        
        switch gesture.state {
        case .began:
            do {
            self.isInteracting = true
            self.navigationController?.popViewController(animated: true)
        }
        case .changed:
            do {
            self.update(scale)
        }
        case .ended, .failed, .cancelled:
            do {
            self.isInteracting = false
            if scale > 0.5 {
                self.finish()
            } else {
                self.cancel()
            }
        }
        default: break
        }
    }
}
