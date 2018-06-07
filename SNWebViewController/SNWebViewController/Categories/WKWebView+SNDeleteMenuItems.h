//
//  WKWebView+SNDeleteMenuItems.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WKWebView (SNDeleteMenuItems)
/**
 *  Fix WKWebView MenuItems
 *  Delete System Items Without cut/copy/paste/delete
 */
+ (void)sn_fixWKWebViewMenuItems;

@end
