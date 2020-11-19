//
//  ViewController.m
//  XZFRuler
//
//  Created by 58 on 2018/11/5.
//  Copyright © 2018年 58. All rights reserved.
//

#import "ViewController.h"
#import "Ruler/XZFRulerView.h"
#import "Ruler/XZFRulerConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *array = @[
                       @{@"date":@"10-29",@"time":@"9:00-10:00",@"name":@"张三",@"title":@"项目周会"},
                       @{@"date":@"10-30",@"time":@"12:00-13:30",@"name":@"张三",@"title":@"项目周会"},
                       @{@"date":@"10-31",@"time":@"16:10-17:50",@"name":@"张三",@"title":@"项目周会"}
                       ];
    
    //配置基本信息（例如：填充颜色，竖线高度颜色，间隔数）
    XZFRulerConfig *rulerConfig = [[XZFRulerConfig alloc] init];
    //eg:例如 修改配置填充色，默认红色，改为蓝色。
    rulerConfig.fillColor = [UIColor blueColor];
    
    //初始化-并展示的view
    XZFRulerView *rulerView = [[XZFRulerView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 60) withConfig:rulerConfig];
    [self.view addSubview:rulerView];
    //填充数据
    [rulerView fillInDataToDrawRect:array];
}


@end
