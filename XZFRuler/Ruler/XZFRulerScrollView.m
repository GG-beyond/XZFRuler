//
//  XZFRulerScrollView.m
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import "XZFRulerScrollView.h"

@interface XZFRulerScrollView ()
@property (nonatomic, strong) XZFRulerConfig *rulerConfig;
@end
@implementation XZFRulerScrollView

- (instancetype)initWithFrame:(CGRect)frame withRulerConfig:(XZFRulerConfig *)rulerConfig{

    if (self = [super initWithFrame:frame]) {
        
        self.rulerConfig = rulerConfig;
        self.rulerConfig.interval = (CGRectGetWidth(self.bounds)-self.rulerConfig.leftOffset*2)/12.0/4.0;
        self.showsHorizontalScrollIndicator = NO;
        self.alwaysBounceHorizontal = YES;
        [self createSubLayer];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)createSubLayer{
    
    //eg:先举个例子 9:00-18:00   10个点
    
    CGFloat leftOffset = self.rulerConfig.leftOffset;//左边距

    CGFloat interval = self.rulerConfig.interval;//间距
    NSInteger num = self.rulerConfig.num;//大间距内 小个数

    CGFloat higLine = self.rulerConfig.higVerLine;
    CGFloat lowLine = self.rulerConfig.lowVerLine;
    
    self.contentSize = CGSizeMake(leftOffset*2+interval*num*12, 0);
    
    for (int i=0; i<13; i++) {
        
        //画 高 的刻度
        CALayer *higLayer = [CALayer layer];
        higLayer.frame = CGRectMake(leftOffset+num*i*interval, 40, 1, higLine);
        higLayer.backgroundColor = self.rulerConfig.higVerColor.CGColor;
        [self.layer addSublayer:higLayer];

        //画 刻度内容 展示
        RulerTimeLabel *timeLabel = [[RulerTimeLabel alloc] initWithFrame:CGRectMake(leftOffset+num*i*interval-20, 20, 40, 20)];
        timeLabel.text = [NSString stringWithFormat:@"%d:00",i+8];
        [timeLabel sizeToFit];
        [self addSubview:timeLabel];
        
        //最后一个不画小线条
        if (i!=12) {
            
            //画 小的刻度
            for (int j=1; j<num; j++) {
                
                CALayer *lowLayer = [CALayer layer];
                lowLayer.frame = CGRectMake(leftOffset+num*i*interval+interval*j, 50, 0.5, lowLine);
                lowLayer.backgroundColor = self.rulerConfig.lowVerColor.CGColor;
                [self.layer addSublayer:lowLayer];
            }
        }
    }
}
- (void)fillInDataToDrawRect:(NSArray *)array{
    
    for (int i=0; i<array.count; i++) {
        
        NSDictionary *dict = array[i];
        NSArray *arr = [dict[@"time"] componentsSeparatedByString:@"-"];
        NSString *startStr = arr[0];
        CGFloat startX = [self getPointXvalue:startStr];
        NSString *endStr = arr[1];
        CGFloat endX = [self getPointXvalue:endStr];
        CALayer *drawLayer = [CALayer layer];
        drawLayer.frame = CGRectMake(self.rulerConfig.leftOffset+startX*self.rulerConfig.interval/15.0, 50, (endX-startX)*self.rulerConfig.interval/15.0, self.rulerConfig.lowVerLine);
        drawLayer.backgroundColor = self.rulerConfig.fillColor.CGColor;
        [self.layer insertSublayer:drawLayer atIndex:0];
    }
    
}

- (NSTimeInterval)getPointXvalue:(NSString *)currentStr{
    
    NSString *starTime = @"8:00";
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:currentStr];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}
@end

@implementation RulerTimeLabel
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]){
        
        self.font = [UIFont systemFontOfSize:10];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
    }
    return self;
}
@end
