//
//  WKWebView+SNSyncConfigUserAgent.m
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import "WKWebView+SNSyncConfigUserAgent.h"

@implementation WKWebView (SNSyncConfigUserAgent)

- (void)sn_configCustomUAWithType:(SNConfigUserAgentType)type customUserAgent:(NSString *)customUserAgent {
    
    if (!customUserAgent || customUserAgent.length <= 0) {
        NSLog(@"WKWebView (SNSyncConfigUserAgent) config with invalid string");
        return;
    }
    
    if(type == kSNConfigUserAgentTypeReplace) {
		if (@available(iOS 9.0, *)) {
            self.customUserAgent = customUserAgent;
        }
    } else if (type == kSNConfigUserAgentTypeAppend) {
		[self evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable userAgent, NSError * _Nullable error) {
			if ([userAgent isKindOfClass:[NSString class]]) {
                NSString *newUserAgent = [NSString stringWithFormat:@"%@-%@", userAgent, customUserAgent];
                if (@available(iOS 9.0, *)) {
                    self.customUserAgent = newUserAgent;
                }
            }
		}];
    } else {
        NSLog(@"WKWebView (SNSyncConfigUserAgent) config with invalid type :%@", @(type));
    }
}

@end
