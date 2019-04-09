//
//  PinkieNavigationItem.swift
//  CustomNavigationBar
//
//  Created by jiazhiyi on 2019/4/4.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

import UIKit

public class PinkieNavigationItem: NSObject {

    var navigationHidden = false
    var title = ""
    var titleLabel: UILabel?
    
    var leftBarButtonItem: PinkieBarButtonItem?
    var rightBarButtonItem: PinkieBarButtonItem?
    var tintColor: UIColor?
}
