//
//  SecondViewController.m
//  NaviTest
//
//  Created by jiazhiyi on 2019/3/15.
//  Copyright © 2019 jiazhiyi. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(respondsToButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"啊啊啊" style:UIBarButtonItemStylePlain target:nil action:nil];

}

- (void)respondsToButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
