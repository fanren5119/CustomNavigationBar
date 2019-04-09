//
//  PinkiePushChangeNavAnimation.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkiePushChangeNavAnimation.h"
#import "PinkieNavigationView.h"
#import "PinkieNavigationController.h"

@interface PinkiePushChangeNavAnimation ()

@property (nonatomic, strong) PinkieNavigationView  *navigationView;

@end

@implementation PinkiePushChangeNavAnimation

- (void)navigationViewPerpare
{
    PinkieNavigationController *nav = (PinkieNavigationController *)self.fromVC.navigationController;
    self.navigationView = nav.navigationView;
    
    CGPoint toTitleCenter = self.toPinkieVC.pinkieItem.titleLabel.center;
    toTitleCenter.x = self.screenWidth / 2;
    self.toPinkieVC.pinkieItem.titleLabel.center = toTitleCenter;
    self.toPinkieVC.pinkieItem.titleLabel.alpha = 0;
    [self.toPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 0;
    [self.toPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 0;
    
    CGPoint fromTitleCenter = self.fromPinkieVC.pinkieItem.titleLabel.center;
    fromTitleCenter.x =  self.screenWidth / 2;
    self.fromPinkieVC.pinkieItem.titleLabel.center = fromTitleCenter;
    self.fromPinkieVC.pinkieItem.titleLabel.alpha = 1;
    [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
    [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
}

- (void)naviationViewAnimate
{
    self.toPinkieVC.pinkieItem.titleLabel.alpha = 1;
    [self.toPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
    [self.toPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
    
    CGPoint fromTitleCenter = self.fromPinkieVC.pinkieItem.titleLabel.center;
    fromTitleCenter.x =  30;
    self.fromPinkieVC.pinkieItem.titleLabel.center = fromTitleCenter;
    self.fromPinkieVC.pinkieItem.titleLabel.alpha = 0;
    [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 0;
    [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 0;
}

- (void)navigationViewAnimateComplete:(BOOL)cancel
{
    if (cancel) {
        self.fromPinkieVC.pinkieItem.titleLabel.alpha = 1;
        [self.fromPinkieVC.pinkieItem.leftBarButtonItem getBarButtonView].alpha = 1;
        [self.fromPinkieVC.pinkieItem.rightBarButtonItem getBarButtonView].alpha = 1;
        [self.navigationView removeNavigationItem:self.toPinkieVC.pinkieItem];
    } else {
        [self.navigationView removeNavigationItem:self.fromPinkieVC.pinkieItem];
    }
}

@end

