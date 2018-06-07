//
//  WKWebView+SNSyncConfigUserAgent.h
//  SNWebViewController
//
//  Created by snlo.
//  Copyright © 2018 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef NS_ENUM (NSInteger, SNConfigUserAgentType){
    kSNConfigUserAgentTypeReplace,     //replace all UA string
    kSNConfigUserAgentTypeAppend,      //append to original UA string
};

@interface WKWebView (SNSyncConfigUserAgent)
/**
 *  Sync Config UA Without WKWebView
 *
 *  @param type            replace or append original UA
 *  @param customString    custom UA string
 */
+ (void)sn_configCustomUAWithType:(SNConfigUserAgentType)type userAgentString:(NSString *)customString;

@end
