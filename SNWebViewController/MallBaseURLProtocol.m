//
//  MallBaseURLProtocol.m
//  AiteCube
//
//  Created by snlo on 2018/4/11.
//  Copyright © 2018年 AiteCube. All rights reserved.
//

#import "MallBaseURLProtocol.h"

#import <UIKit/UIKit.h>

static NSString*const sourUrl  = @"http://cdn.web.chelaile.net.cn/ch5/styles/main-1cb999d572.css";
static NSString*const localUrl = @"http://h5apps.scity.cn/hack/cdn.web.chelaile.net.cn/ch5/styles/main-1cb999d572.css";
static NSString* const FilteredKey = @"FilteredKey";

@implementation MallBaseURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
//    NSLog(@"%@ %@",request.URL.absoluteString ,request.allHTTPHeaderFields);
//    只处理http和https请求
//    NSString *scheme = [[request URL] scheme];
//    if ( ([scheme caseInsensitiveCompare:@"http"]  == NSOrderedSame ||
//          [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame )) {
//        //看看是否已经处理过了，防止无限循环
//        if ([NSURLProtocol propertyForKey:FilteredKey inRequest:request])
//            return NO;
//
//        return YES;
//    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
////    截取重定向
//    if ([request.URL.absoluteString isEqualToString:sourUrl]) {
//        NSURL* url1 = [NSURL URLWithString:localUrl];
////		NSURL* url1 = [NSURL URLWithString:@"http://www.baidu.com"];
//        mutableReqeust = [NSMutableURLRequest requestWithURL:url1];
//    }
    return mutableReqeust;
}


- (void)startLoading {
    NSMutableURLRequest* request = self.request.mutableCopy;
    [NSURLProtocol setProperty:@YES forKey:FilteredKey inRequest:request];
    
    NSData* data = UIImagePNGRepresentation([UIImage imageNamed:@"public_heart_solid"]);
    NSURLResponse* response = [[NSURLResponse alloc] initWithURL:self.request.URL MIMEType:@"image/png" expectedContentLength:data.length textEncodingName:nil];
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    [self.client URLProtocol:self didLoadData:data];
    [self.client URLProtocolDidFinishLoading:self];
}
- (void)stopLoading {
    
}

@end
