//
//  ChrysanthemumRemnants.m
//  DrawCircle
//
//  Created by Qi Jiyu on 16/3/21.
//  Copyright © 2016年 Qi Jiyu. All rights reserved.
//

#import "JYFrostedProgressHUD.h"

#define kScreen [[UIScreen mainScreen] bounds].size

@implementation JYFrostedProgressHUD

- (instancetype)initWithView:(UIView *)selfView {
    if (self = [super init]) {
        self.parentView = selfView;
        self.frame = [[UIScreen mainScreen] bounds];
        [self backImage];
        [self basicData];
        [self drawLineAnimation];
        [self Animation];
    }
    return self;
}

- (void)basicData {
//    self.backgroundColor = [UIColor colorWithWhite:0.800 alpha:0.500];
    if (CGPointEqualToPoint(_location, CGPointZero)) {
        _location = CGPointMake(kScreen.width / 2, kScreen.height / 2);
    }
    if (_radius == 0.0) {
        _radius = 20.0f;
    }
}
/*
- (void)drawRect:(CGRect)rect {
    
}
*/
-(void)drawLineAnimation {
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(_location.x, _location.y) radius:_radius startAngle:0 endAngle:M_PI * 2 - 1 clockwise:YES];
    _arcLayer = [CAShapeLayer layer];
    _arcLayer.path = path.CGPath;//46,169,230
    _arcLayer.fillColor = [UIColor clearColor].CGColor;
    _arcLayer.strokeColor = [UIColor grayColor].CGColor;
    _arcLayer.lineWidth = 1;
    _arcLayer.frame=self.frame;
    [self.layer addSublayer:_arcLayer];
    
    //画圆的动画
    CABasicAnimation *bas = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration = 2;
    bas.delegate = self;
    bas.fromValue = [NSNumber numberWithInteger:0];
    bas.toValue = [NSNumber numberWithInteger:1];
    [_arcLayer addAnimation:bas forKey:@"key"];
}

- (void)Animation {
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    
    [_arcLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)backImage {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithData:UIImageJPEGRepresentation([self getImage], 1)];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:image forKey:kCIInputImageKey];
    //高斯半径
    [filter setValue:@5.0f forKey: @"inputRadius"];
    //得到Image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    //裁剪得到的Image, 第二个参数是裁剪的区域
    CGImageRef outImage = [context createCGImage:result fromRect:self.parentView.frame];
    //CGImage转Image
    UIImage * blurImage = [UIImage imageWithCGImage:outImage];
    
    CGImageRelease(outImage);
    
    self.backgroundColor = [UIColor colorWithPatternImage:blurImage];
}

- (UIImage *)getImage {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(_parentView.frame.size.width, _parentView.frame.size.height), NO, 1.0);  //NO，YES 控制是否透明
    [self.parentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)start {
    
}

- (void)stop {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    [self removeFromSuperview];
}

@end
