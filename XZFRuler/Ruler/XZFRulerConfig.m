//
//  XZFRulerConfig.m
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import "XZFRulerConfig.h"

@implementation XZFRulerConfig
- (instancetype)init{
    
    if (self = [super init]) {
        //默认参数设置
        self.leftOffset = 20.0f;
        self.rightOffset = 20.0f;
        self.interval = 10.0f;
        self.num = 4;
        self.higVerLine = 20.0f;
        self.lowVerLine = 10.0f;
        self.higVerColor = [UIColor whiteColor];
        self.lowVerColor = [UIColor whiteColor];
        self.fillColor = [UIColor redColor];
    }
    return self;
}
@end
