//
//  XZFRulerScrollView.h
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZFRulerConfig.h"

NS_ASSUME_NONNULL_BEGIN
@interface RulerTimeLabel : UILabel


@end

@interface XZFRulerScrollView : UIScrollView
- (instancetype)initWithFrame:(CGRect)frame withRulerConfig:(XZFRulerConfig *)rulerConfig;
- (void)fillInDataToDrawRect:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
