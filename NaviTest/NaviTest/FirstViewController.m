//
//  FirstViewController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/3/15.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"firstviewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"firstviewWillDisappear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"firstviewDidAppear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"firstviewDidDisappear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.pinkieItem.title = @"你hui";
//    self.pinkieItem.navigationHidden = YES;
//
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 100);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(150, 100, 100, 100);
    button2.backgroundColor = [UIColor blackColor];
    [button2 addTarget:self action:@selector(respondsToButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)respondsToButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)respondsToButton2
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
