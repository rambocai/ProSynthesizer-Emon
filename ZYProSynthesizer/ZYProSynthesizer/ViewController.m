//
//  ViewController.m
//  ZYProSynthesizer
//
//  Created by 竹雨 on 2017/12/20.
//  Copyright © 2017年 竹雨. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ZYProperty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self synthesizerPropertyWithTestData];
}

- (void)synthesizerPropertyWithTestData {
    // 解析plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"zyTest.plist" ofType:nil];
    NSDictionary *rootDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *dictArr = rootDict[@"list"];
    
    [NSObject createPropertyCodeWithDict:dictArr[0]];
}


@end
