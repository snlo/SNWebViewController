//
//  SNWebTool.m
//  SNWebViewController
//
//  Created by snlo on 2018/6/12.
//  Copyright © 2018年 snlo. All rights reserved.
//

#import "SNWebTool.h"

#import <SNFoundation/SNFoundation.h>

@implementation SNWebTool

+ (NSMutableDictionary *)handleJsBody:(NSDictionary *)body urlString:(NSString * __autoreleasing *)urlString callBackString:(NSString * __autoreleasing *)callBackString {
    
    __block NSMutableDictionary * muDic = [[NSMutableDictionary alloc] init];
    
    [body enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"url"]) {
            *urlString = obj;
        } else if ([key localizedCaseInsensitiveContainsString:@"call"]
                   && [key localizedCaseInsensitiveContainsString:@"back"]) {
            *callBackString = obj;
        } else {
            if ([obj isKindOfClass:[NSArray class]]) {
                NSArray * arr = obj;
                [muDic setValue:[arr sn_json] forKey:key];
            } else {
                [muDic setValue:obj forKey:key];
            }
        }
    }];
    if ((*callBackString).length < 1) {
        *callBackString = @"postCallback";
    }
    return muDic;
}

@end
