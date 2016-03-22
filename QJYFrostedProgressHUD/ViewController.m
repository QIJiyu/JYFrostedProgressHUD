//
//  ViewController.m
//  QJYFrostedProgressHUD
//
//  Created by 祁继宇 on 16/3/21.
//  Copyright © 2016年 祁继宇. All rights reserved.
//

#import "ViewController.h"
#import "JYFrostedProgressHUD.h"

@interface ViewController ()

@property (nonatomic, strong) JYFrostedProgressHUD *testHUD;
@property (nonatomic, assign) BOOL isYes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1444721500702@2x" ofType:@"jpeg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:path]];
    
    _testHUD = [[JYFrostedProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_testHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
