//
//  ViewController2.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/4/9.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "ViewController2.h"
#import "FirstViewController.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 100);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    self.pinkieItem.title = @"你哈";
    //    self.navigationTitle = @"你哈";
}

- (void)respondsToButton
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

@end
