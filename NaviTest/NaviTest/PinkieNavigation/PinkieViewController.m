//
//  PinkieViewController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieViewController.h"
#import "PinkieNavigationController.h"

@interface PinkieViewController ()

@end

@implementation PinkieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (PinkieNavigationItem *)pinkieItem
{
    if (_pinkieItem == nil) {
        _pinkieItem = [[PinkieNavigationItem alloc] init];
    }
    return _pinkieItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    PinkieNavigationController *nav = (PinkieNavigationController *)self.navigationController;
    PinkieNavigationView *navigationView = nav.navigationView;
    if (animated) {
        [navigationView addNavigationItem:self.pinkieItem];
        return;
    }
    
    [navigationView removeAllItems];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    if (self.pinkieItem.navigationHidden) {
        CGRect rect = navigationView.frame;
        rect.origin.x = width;
        navigationView.frame = rect;
    } else {
        CGRect rect = navigationView.frame;
        rect.origin.x = 0;
        navigationView.frame = rect;
        [navigationView addNavigationItem:self.pinkieItem];
    }
}


@end
