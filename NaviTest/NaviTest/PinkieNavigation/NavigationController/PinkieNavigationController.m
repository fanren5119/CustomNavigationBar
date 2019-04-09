//
//  PinkieNavigationController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "PinkieNavigationController.h"
#import "PinkiePopAnimatedTransitioning.h"
#import "PinkieNavigationDelegateImp.h"

@interface PinkieNavigationController ()

@property (nonatomic, strong) PinkiePopInteractiveTransitioning     *popTransition;
@property (nonatomic, strong) PinkieNavigationDelegateImp           *delegateImp;

@end

@implementation PinkieNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBarHidden = YES;
    [self setupDelegateImp];
    [self setupUI];
}

- (void)setupDelegateImp
{
    self.popTransition = [[PinkiePopInteractiveTransitioning alloc] init];
    self.popTransition.navigationController = self;
    
    self.delegateImp = [[PinkieNavigationDelegateImp alloc] init];
    self.delegateImp.transitioning = self.popTransition;
    self.delegate = self.delegateImp;
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setupUI
{
    [self setupNavigationView];
}

- (void)setupNavigationView
{
    CGFloat height = 64.0;
    CGFloat width = self.view.frame.size.width;
    CGRect rect = CGRectMake(0.0, 0.0, width, height);
    self.navigationView = [[PinkieNavigationView alloc] initWithFrame:rect];
    self.navigationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.navigationView];
}


@end
