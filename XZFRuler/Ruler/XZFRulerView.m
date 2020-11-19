//
//  XZFRulerView.m
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import "XZFRulerView.h"
#import "XZFRulerScrollView.h"

@interface XZFRulerView ()

@property (nonatomic, strong) XZFRulerConfig *rulerConfig;
@property (nonatomic, strong) XZFRulerScrollView *scrollView;
@end
@implementation XZFRulerView

- (instancetype)initWithFrame:(CGRect)frame withConfig:(XZFRulerConfig *)rulerConfig{
    
    if (self = [super initWithFrame:frame]) {
        
        self.rulerConfig = rulerConfig;
        [self addSubview:self.scrollView];
    }
    return self;
}
- (XZFRulerScrollView *)scrollView{
    
    if (!_scrollView) {
        
        _scrollView = [[XZFRulerScrollView alloc] initWithFrame:self.bounds withRulerConfig:self.rulerConfig];
    }
    return _scrollView;
}
#pragma mark - Private Method
- (void)fillInDataToDrawRect:(NSArray *)array{
    
    [self.scrollView fillInDataToDrawRect:array];
}

@end
