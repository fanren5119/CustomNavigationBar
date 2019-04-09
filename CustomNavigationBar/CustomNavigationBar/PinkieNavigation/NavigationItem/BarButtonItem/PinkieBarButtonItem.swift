//
//  PinkieBarButtonItem.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import Foundation
import UIKit

protocol PinkieBarButtonItem {
    
    func barItemType() -> BarItemType
    
    func setTintColor(color: UIColor)
    
    func setEnable(enable: Bool)
    
    func getBlock() -> (() -> Void)?
    
    func getBarButtonView() -> PinkieBarButtonView
    
    func reset(image:UIImage, title: String)
    
    func reset(image:UIImage)
    
    func reset(title:String)
}

enum BarItemType: Int {
    case title  = 0
    case image  = 1
    case double = 2
}
