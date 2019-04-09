//
//  PinkieImageBarButtonItem.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import Foundation
import UIKit

class PinkieImageBarButtonItem: PinkieBarButtonItem {
    
    var tintColor: UIColor?
    
    var editEnable: Bool?
    
    var block: (() -> Void)?
    
    var imageName: String
    
    var itemView: PinkieImageBarButtonView?
    
    func barItemType() -> BarItemType {
        return .image
    }
    
    func setTintColor(color: UIColor) {
        tintColor = color
        self.itemView?.setTintColor(color: color)
    }
    
    func setEnable(enable: Bool) {
        editEnable = enable
        self.itemView?.setEnable(enable: enable)
    }
    
    func getBlock() -> (() -> Void)? {
        return block
    }
    
    func reset(image:UIImage, title: String) {
        self.itemView?.reset(image: image, title: title)
    }
    
    func reset(image:UIImage) {
        self.itemView?.reset(image: image)
    }
    
    func reset(title:String) {
        self.itemView?.reset(title: title)
    }
    
    init(imageName: String, block: (() -> Void)?) {
        self.imageName = imageName
        self.block = block
    }
    
    func getBarButtonView() -> PinkieBarButtonView {
        if self.itemView == nil {
            self.itemView = PinkieImageBarButtonView(imageName: imageName, block: block)
        }
        self.itemView?.setTintColor(color: self.tintColor)
        self.itemView?.setEnable(enable: self.editEnable ?? true)
        return self.itemView!
    }
    
    
}
