//
//  ChrysanthemumRemnants.h
//  DrawCircle
//
//  Created by Qi Jiyu on 16/3/21.
//  Copyright © 2016年 Qi Jiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYFrostedProgressHUD : UIView

@property (nonatomic, strong) CAShapeLayer *arcLayer;

@property (nonatomic, strong) UIView *parentView;// 父视图的view

@property (nonatomic, assign) CGPoint location; //菊花的位置, 默认中心
@property (nonatomic, assign) float radius;//菊花半径, 默认20.0f

/**
 *  初始化方法
 *
 *  @param bigView 本视图的 view 层
 */
- (instancetype)initWithView:(UIView *)selfView;

/**
 *  停止转圈
 */
- (void)stop;

@end
