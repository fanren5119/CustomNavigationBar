//
//  PinkieNavigationView.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

class PinkieNavigationView: UIView {
    
    var itemArray = NSMutableArray()

    func addNavigationItem(item: PinkieNavigationItem?) {
        if let item = item {
            if !self.itemArray.contains(item) {
                
                var leftWidth = 8.0
                if let leftItemView = item.leftBarButtonItem?.getBarButtonView() {
                    leftWidth = leftItemView.viewWidth()
                    leftItemView.frame = CGRect(x: 8.0, y: Double(self.frame.height - 44.0), width: leftWidth, height: 44.0)
                    self.addSubview(leftItemView)
                }
                
                var rightWidth = 8.0
                if let rightItemView = item.rightBarButtonItem?.getBarButtonView() {
                    rightWidth = rightItemView.viewWidth()
                    rightItemView.frame = CGRect(x: Double(self.frame.width) - rightWidth - 8.0, y: Double(self.frame.height - 44), width: rightWidth, height: 44.0)
                    self.addSubview(rightItemView)
                }
                
                let width = Double(self.frame.width) - max(leftWidth, rightWidth) * 2.0 - 16.0
                let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: width, height: 44.0))
                label.center = CGPoint(x: self.frame.width / 2.0, y: self.frame.height - 22.0)
                label.textAlignment = .center
                label.text = item.title
                self.addSubview(label)
                item.titleLabel = label
                self.itemArray.add(item)
            }
        }
    }

    func removeNavigationItem(item: PinkieNavigationItem?) {
        if let item = item {
            if self.itemArray.contains(item) {
                item.titleLabel?.removeFromSuperview()
                item.leftBarButtonItem?.getBarButtonView().removeFromSuperview()
                item.rightBarButtonItem?.getBarButtonView().removeFromSuperview()
                self.itemArray.remove(item)
            }
        }
    }
    
    func removeAllItems() {
        self.itemArray.forEach { (item) in
            if let item = item as? PinkieNavigationItem {
                item.titleLabel?.removeFromSuperview()
                item.leftBarButtonItem?.getBarButtonView().removeFromSuperview()
                item.rightBarButtonItem?.getBarButtonView().removeFromSuperview()
            }
        }
        self.itemArray.removeAllObjects()
    }
}
