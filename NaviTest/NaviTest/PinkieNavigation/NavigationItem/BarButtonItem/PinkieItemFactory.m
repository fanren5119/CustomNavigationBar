//
//  PinkieItemFactory.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieItemFactory.h"
#import "PinkieImageBarButtonItem.h"
#import "PinkieTitleBarButtonItem.h"
#import "PinkieDoubleBarButtonItem.h"

@implementation PinkieItemFactory

+ (id<PinkieBarButtonItem>)barButtonItemWithImage:(NSString *)image actionBlock:(BarItemBlock)actionBlock
{
    return [[PinkieImageBarButtonItem alloc] initWithImageName:image block:actionBlock];
}

+ (id<PinkieBarButtonItem>)barButtonItemWithTitle:(NSString *)title actionBlock:(BarItemBlock)actionBlock
{
    return [[PinkieTitleBarButtonItem alloc] initWithTitle:title block:actionBlock];
}

+ (id<PinkieBarButtonItem>)barButtonItem:(NSString *)image title:(NSString *)title actionBlock:(BarItemBlock)actionBlock
{
    return [[PinkieDoubleBarButtonItem alloc] initWithImageName:image title:title block:actionBlock];
}

@end
