//
//  PinkieNavigationItem.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PinkieBarButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieNavigationItem : NSObject

@property (nonatomic, assign) BOOL                      navigationHidden;
@property (nonatomic, strong) NSString                  *title;
@property (nonatomic, strong) UILabel                   *titleLabel;
@property (nonatomic, strong) id<PinkieBarButtonItem>   leftBarButtonItem;
@property (nonatomic, strong) id<PinkieBarButtonItem>   rightBarButtonItem;
@property (nonatomic, strong) UIColor                   *tintColor;

@end

NS_ASSUME_NONNULL_END
