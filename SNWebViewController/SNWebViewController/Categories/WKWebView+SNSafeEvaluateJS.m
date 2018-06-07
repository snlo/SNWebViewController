//
//  WKWebView+SNSafeEvaluateJS.m
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import "WKWebView+SNSafeEvaluateJS.h"

@implementation WKWebView (SNSafeEvaluateJS)

- (void)sn_safeAsyncEvaluateJavaScriptString:(NSString *)script {
    [self sn_safeAsyncEvaluateJavaScriptString:script completionBlock:nil];
}
- (void)sn_safeAsyncEvaluateJavaScriptString:(NSString *)script completionBlock:(SNSafeEvaluateJSCompletion)block {
    if (!script) {
        return;
    }
    [self evaluateJavaScript:script
            completionHandler:^(id result, NSError *_Nullable error) {
                // retainify self
                __unused __attribute__((objc_ownership(strong))) __typeof__(self) self_retain_ = self;
                
                if (!error) {
                    if (block) {
                        if (!result || [result isKindOfClass:[NSNull class]]) {
                            block(@"");
                        } else if ([result isKindOfClass:[NSObject class]]) {
                            block((NSObject *)result);
                        }  else {
                            NSAssert(NO,@"WKWebView (SNSafeEvaluateJS) evaluate js return type:%@,js:%@",
                                      NSStringFromClass([result class]),
                                      script);
                        }
                    }
                } else {
                    NSLog(@"WKWebView evaluate js Error : %@ %@", error.description, script);
                    if (block) {
                        block(@"");
                    }
                }
            }];
}

@end
