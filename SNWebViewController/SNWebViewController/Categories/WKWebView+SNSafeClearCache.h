//
//  WKWebView+SNSafeClearCache.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WKWebView (SNSafeClearCache)
/**
 *  WKWebView Clear All Cache Include iOS8
 */
+ (void)sn_safeClearAllCache;

- (void)sn_clearBrowseHistory;

@end
