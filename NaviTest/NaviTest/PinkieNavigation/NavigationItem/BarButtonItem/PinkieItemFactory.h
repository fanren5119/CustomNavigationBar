//
//  PinkieItemFactory.h
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PinkieBarButtonItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PinkieItemFactory : NSObject

+ (id<PinkieBarButtonItem>)barButtonItemWithImage:(NSString *)image actionBlock:(BarItemBlock)actionBlock;

+ (id<PinkieBarButtonItem>)barButtonItemWithTitle:(NSString *)title actionBlock:(BarItemBlock)actionBlock;

+ (id<PinkieBarButtonItem>)barButtonItem:(NSString *)image title:(NSString *)title actionBlock:(BarItemBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
