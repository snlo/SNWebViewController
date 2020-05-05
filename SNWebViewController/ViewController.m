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

#import "MallBaseURLProtocol.h"

@interface ViewController () <TestProtocol>

@end

@implementation ViewController

- (void)dealloc {
	NSLog(@"%s",__func__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    pod trunk push SNWebViewController.podspec --verbose --allow-warnings --use-libraries
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.reloadUrl = @"http://www.baidu.com/";
    self.isHasNativeNavigation = YES;
	
	@weakify(self);
//	self.webTitle = @"xxx";
//    [RACObserve(self, webTitle) subscribeNext:^(id  _Nullable x) {
//        self_weak_.title = x;
//    }];
//	self.allowSettingTitle = NO;
//	self.title = @"xxx";
    self.progressView.tintColor = [UIColor greenColor];
//	[self setNoneSelect:YES];
	
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(0, 100, SCREEN_WIDTH, 60);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.webview addSubview:button];
    
	
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self_weak_.webview goBack];
    }];
    
    self.webview.scrollView.bounces = YES;
    
    [self setNoneSelect:YES];
	
	[self setURLProtocolClass:[MallBaseURLProtocol class] scriptMessageHandlerNames:@[@"asdf"]];
    

	[RACObserve(self.webview, URL) subscribeNext:^(NSURL *  _Nullable x) {
		NSLog(@"url == %@",x.absoluteString);

	}];
	
}
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//	NSLog(@"%s",__func__);
//}

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
