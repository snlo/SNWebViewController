//
//  WKWebView+SNSafeCookies.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WKWebView (SNSafeCookies)

- (void)sn_setCookieWithName:(NSString *)name value:(NSString *)value domain:(NSString *)domain path:(NSString *)path expiresDate:(NSDate *)expiresDate;

- (void)sn_deleteCookiesWithName:(NSString *)name;

- (NSSet<NSString *> *)sn_getAllCustomCookiesName;

- (void)sn_deleteAllCustomCookies;

@end
