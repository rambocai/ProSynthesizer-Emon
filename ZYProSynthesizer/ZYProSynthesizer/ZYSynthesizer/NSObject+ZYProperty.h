//
//  NSObject+ZYProperty.h
//  ZYProSynthesizer
//
//  Created by 竹雨 on 2017/12/20.
//  Copyright © 2017年 竹雨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ZYProperty)

// 通过解析字典自动生成属性代码
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;



@end
