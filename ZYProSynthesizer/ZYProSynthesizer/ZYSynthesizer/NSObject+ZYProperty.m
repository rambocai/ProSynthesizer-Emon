//
//  NSObject+ZYProperty.m
//  ZYProSynthesizer
//
//  Created by 竹雨 on 2017/12/20.
//  Copyright © 2017年 竹雨. All rights reserved.
//

#import "NSObject+ZYProperty.h"

@implementation NSObject (ZYProperty)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict {
    
    NSMutableString *mString = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"名称:%@ --- 类型:%@", key, [obj class]);
        
        /*
         * NSString *polity;        // 属性策略,判断value类型，对象类型strong，基本数据类型assign
         * NSString *type;          // 属性类型
         * NSString *propertyName;  // 属性名
         */
        
        NSString *code;
        
        // int __NSCFNumber
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;", key];
        }
        // NSArray __NSCFArray
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;", key];
        }
        // NSDictionary __NSCFDictionary
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;", key];
        }
        // BOOL __NSCFBoolean
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;", key];
        }
        // NSDate __NSTaggedDate
        else if ([obj isKindOfClass:NSClassFromString(@"__NSTaggedDate")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDate %@;", key];
        }
        // NSData __NSCFData
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFData")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSData %@;", key];
        }
        
        // 属性类型为String类型，或者其他的数据类型统一写成NSString
        // String类型：无值时候 __NSCFConstantString
        // String类型：有值为数字或者YES/NO/true/false/<> NSTaggedPointerString
        // String类型：其他__NSCFString
        else {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString %@;", key];
        }
        
        //code = [NSString stringWithFormat:@"@property (nonatomic, %@) %@ %@;", polity, type, propertyName];
        //code = [NSString stringWithFormat:@"@property (nonatomic, %@) %@ %@;", polity, type, key];
        [mString appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@", mString);
}



@end
