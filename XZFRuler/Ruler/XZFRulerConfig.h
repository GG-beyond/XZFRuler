//
//  XZFRulerConfig.h
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZFRulerConfig : NSObject

/*左边距 默认 40  */
@property (nonatomic, assign) CGFloat leftOffset;
/*右边距  默认 40 */
@property (nonatomic, assign) CGFloat rightOffset;
/*间隔 默认 10 */
@property (nonatomic, assign) CGFloat interval;
/*中间份数--个数  默认 4个 */
@property (nonatomic, assign) NSInteger num;

/*高竖线-的-高度 higVerLine = hight vertical line   默认 20*/
@property (nonatomic, assign) CGFloat higVerLine;
/*低竖线-的-高度 lowVerLine = low vertical line   默认 10*/
@property (nonatomic, assign) CGFloat lowVerLine;

/*高竖线-的-高度 higVerColor = hight vertical color  默认 白色*/
@property (nonatomic, strong) UIColor *higVerColor;//高 线条颜色
/*低竖线-的-高度 lowVerColor = low vertical color   默认 白色*/
@property (nonatomic, strong) UIColor *lowVerColor;
/*填充颜色  */
@property (nonatomic, strong) UIColor *fillColor;

@end

NS_ASSUME_NONNULL_END
