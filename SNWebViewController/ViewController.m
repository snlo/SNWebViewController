//
//  ViewController.m
//  SNWebViewController
//
//  Created by snlo on 2018/5/16.
//  Copyright © 2018年 snlo. All rights reserved.
//

#import "ViewController.h"

#import "TestProtocol.h"

#import <SNTool.h>

#import <ReactiveObjC.h>

@interface ViewController () <TestProtocol>

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    
    self.reloadUrl = @"https://www.baidu.com";
//    self.isHasNativeNavigation = YES;
    
    [RACObserve(self, webTitle) subscribeNext:^(id  _Nullable x) {
        self.title = x;
    }];
    self.progressView.tintColor = [UIColor greenColor];
    
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(0, 100, SCREEN_WIDTH, 60);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.webview addSubview:button];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.webview goBack];
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
//    self.webview.frame = CGRectMake(0, 10, SCREEN_WIDTH, 400);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
