//
//  PinkieItemFactory.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/8.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import Foundation

class PinkieItemFactory {
    static func barButtonItem(image: String, actionBlock: (() -> Void)?) -> PinkieBarButtonItem {
        return PinkieImageBarButtonItem(imageName: image, block: actionBlock)
    }
    
    static func barButtonItem(title: String, actionBlock: (() -> Void)?) -> PinkieBarButtonItem {
        return PinkieTitleBarButtonItem(title: title, block: actionBlock)
    }
    
    static func barButtonItem(image: String, title: String, actionBlock: (() -> Void)?) -> PinkieBarButtonItem {
        return PinkieDoubleBarButtonItem(imageName: image, title: title, block: actionBlock)
    }
}
