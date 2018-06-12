//
//  SNWebTool.h
//  SNWebViewController
//
//  Created by snlo on 2018/6/12.
//  Copyright © 2018年 snlo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNWebTool : NSObject

/**
 处理Js参数
 */
+ (NSMutableDictionary *)handleJsBody:(NSDictionary *)body urlString:(NSString **)urlString callBackString:(NSString **)callBackString;

@end
