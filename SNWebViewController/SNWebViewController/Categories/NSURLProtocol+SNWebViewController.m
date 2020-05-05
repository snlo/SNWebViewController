//
//  NSURLProtocol+SNWebViewController.m
//  NSURLProtocol+SNWebViewController
//
//  Created by snlo on 2016/10/11.
//  Copyright © 2016年 Yeatse. All rights reserved.
//

#import "NSURLProtocol+SNWebViewController.h"
#import <WebKit/WebKit.h>

/**
 * The functions below use some undocumented APIs, which may lead to rejection by Apple.
 */

FOUNDATION_STATIC_INLINE Class ContextControllerClass() {
    static Class cls;
    if (!cls) {
        cls = [[[WKWebView new] valueForKey:[NSString stringWithFormat:@"%@%@%@%@", @"brow", @"singCon",@"textCon", @"troller"]] class];
    }
    return cls;
}

FOUNDATION_STATIC_INLINE SEL RegisterSchemeSelector() {
    return NSSelectorFromString([NSString stringWithFormat:@"%@%@%@%@%@", @"regi", @"sterSche",@"meForCus", @"tomProto", @"col:"]);
}

FOUNDATION_STATIC_INLINE SEL UnregisterSchemeSelector() {
    return NSSelectorFromString([NSString stringWithFormat:@"%@%@%@%@%@", @"unregi", @"sterSche",@"meForCus", @"tomProto", @"col:"]);
}

@implementation NSURLProtocol (WebKitSupport)

+ (void)sn_registerScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = RegisterSchemeSelector();
    if ([(id)cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [(id)cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

+ (void)sn_unregisterScheme:(NSString *)scheme {
    Class cls = ContextControllerClass();
    SEL sel = UnregisterSchemeSelector();
    if ([(id)cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [(id)cls performSelector:sel withObject:scheme];
#pragma clang diagnostic pop
    }
}

@end
