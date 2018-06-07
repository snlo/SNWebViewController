//
//  WKWebView+SNSafeEvaluateJS.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef void (^SNSafeEvaluateJSCompletion)(NSObject *result);

@interface WKWebView (SNSafeEvaluateJS)
/**
 *  Safe Evaluate JS And Retainify Webview For CallBack
 */
- (void)sn_safeAsyncEvaluateJavaScriptString:(NSString *)script;

/**
 *  Safe Evaluate JS And Retainify Webview For CallBack
 *  Make Sure CallBack IS NSString
 */
- (void)sn_safeAsyncEvaluateJavaScriptString:(NSString *)script completionBlock:(SNSafeEvaluateJSCompletion)block;

@end
