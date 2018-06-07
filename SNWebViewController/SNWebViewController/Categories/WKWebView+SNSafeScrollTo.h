//
//  WKWebView+SNSafeScrollTo.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef void (^SNSafeScrollToCompletionBlock)(BOOL success , NSInteger loopTimes);

@interface WKWebView (SNSafeScrollTo)
/**
 *  WKWebView Safe ScrollTo Specific Offset Without Blank Screen
 *
 *  @param offset               webView Offset
 *  @param maxRunloops          max wait runloops
 *  @param completionBlock      complete block
 */
- (void)sn_scrollToOffset:(CGFloat)offset maxRunloops:(NSUInteger)maxRunloops completionBlock:(SNSafeScrollToCompletionBlock)completionBlock;

@end
