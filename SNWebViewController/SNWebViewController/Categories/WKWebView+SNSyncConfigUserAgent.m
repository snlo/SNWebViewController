//
//  WKWebView+SNSyncConfigUserAgent.m
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import "WKWebView+SNSyncConfigUserAgent.h"

@implementation WKWebView (SNSyncConfigUserAgent)

+ (void)sn_configCustomUAWithType:(SNConfigUserAgentType)type userAgentString:(NSString *)customString {
    
    if (!customString || customString.length <= 0) {
        NSLog(@"WKWebView (SNSyncConfigUserAgent) config with invalid string");
        return;
    }
    
    if(type == kSNConfigUserAgentTypeReplace) {
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:customString, @"UserAgent", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    } else if (type == kSNConfigUserAgentTypeAppend) {
        UIWebView *webView = [[UIWebView alloc] init];
        NSString *originalUserAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        NSString *appUserAgent =
        [NSString stringWithFormat:@"%@-%@", originalUserAgent, customString];
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:appUserAgent, @"UserAgent", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    } else {
        NSLog(@"WKWebView (SNSyncConfigUserAgent) config with invalid type :%@", @(type));
    }
}

@end
