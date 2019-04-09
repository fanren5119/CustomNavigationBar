//
//  PinkieNavigationView.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationView.h"

@interface PinkieNavigationView ()

@property (nonatomic, strong) NSMutableArray  *itemArray;

@end

@implementation PinkieNavigationView

- (void)addNavigationItem:(PinkieNavigationItem *)item
{
    if ([self.itemArray containsObject:item]) {
        return;
    }
    
    PinkieBarButtonView *leftItemView = [item.leftBarButtonItem getBarButtonView];
    CGFloat leftWidth = [leftItemView viewWidth];
    leftItemView.frame = CGRectMake(8.0, self.frame.size.height - 44.0, leftWidth, 44.0);
    [self addSubview:leftItemView];
    
    PinkieBarButtonView *rightItemView = [item.rightBarButtonItem getBarButtonView];
    CGFloat rightWidth = [rightItemView viewWidth];
    rightItemView.frame = CGRectMake(self.frame.size.width - rightWidth - 8.0, self.frame.size.height - 44, rightWidth, 44.0);
    [self addSubview:rightItemView];
    
    CGFloat width = self.frame.size.width - MAX(leftWidth, rightWidth) * 2.0 - 16.0;
    CGRect rect = CGRectMake(0.0, 0.0, width, 44.0);
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height - 22.0);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = item.title;
    [self addSubview:label];
    item.titleLabel = label;
    [self.itemArray addObject:item];
}

- (void)removeNavigationItem:(PinkieNavigationItem *)item
{
    if ([self.itemArray containsObject:item]) {
        [item.titleLabel removeFromSuperview];
        [[item.leftBarButtonItem getBarButtonView] removeFromSuperview];
        [[item.rightBarButtonItem getBarButtonView] removeFromSuperview];
        [self.itemArray removeObject:item];
    }
}

- (void)removeAllItems
{
    for (PinkieNavigationItem *item in self.itemArray) {
        [item.titleLabel removeFromSuperview];
        [[item.leftBarButtonItem getBarButtonView] removeFromSuperview];
        [[item.rightBarButtonItem getBarButtonView] removeFromSuperview];
    }
    [self.itemArray removeAllObjects];
}

- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _itemArray;
}

@end
