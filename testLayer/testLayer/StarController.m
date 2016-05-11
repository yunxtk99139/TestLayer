//
//  StarController.m
//  testLayer
//
//  Created by zhuyun on 16/5/11.
//  Copyright © 2016年 codera. All rights reserved.
//

#import "StarController.h"

@interface StarController ()
@property (weak, nonatomic) IBOutlet UIView *someView;

@end

@implementation StarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBezierPath* rwPath = [UIBezierPath new];
    CAShapeLayer* rwLayer = [CAShapeLayer new];
    [self setUpRWPath:rwPath];
    [self setUpRWLayer:rwLayer path:rwPath];
    [_someView.layer addSublayer:rwLayer];
    // Do any additional setup after loading the view.
}
- (void)setUpRWPath:(UIBezierPath* )rwPath{
    [rwPath moveToPoint:CGPointMake(0.22, 124.79)];
    [rwPath addLineToPoint:CGPointMake(0.22, 249.57)];
    [rwPath addLineToPoint:CGPointMake(124.89, 249.57)];
    [rwPath addLineToPoint:CGPointMake(249.57, 249.57)];
    [rwPath addLineToPoint:CGPointMake(249.57, 143.79)];
    [rwPath addCurveToPoint:CGPointMake(249.37, 38.25) controlPoint1: CGPointMake(249.57, 85.64) controlPoint2: CGPointMake(249.47, 38.15)];
    [rwPath addCurveToPoint:CGPointMake(206.47, 112.47) controlPoint1: CGPointMake(249.27, 38.35) controlPoint2: CGPointMake(229.94, 71.76)];
    [rwPath addCurveToPoint:CGPointMake(163.46, 186.84) controlPoint1: CGPointMake(182.99, 153.19) controlPoint2: CGPointMake(163.61, 186.65)];
    [rwPath addCurveToPoint:CGPointMake(146.17, 156.99) controlPoint1: CGPointMake(163.27, 187.03) controlPoint2: CGPointMake(155.48, 173.59)];
    [rwPath addCurveToPoint:CGPointMake(128.79, 127.08) controlPoint1: CGPointMake(136.82, 140.43) controlPoint2: CGPointMake(129.03, 126.94)];
    [rwPath addCurveToPoint:CGPointMake(109.31, 157.77) controlPoint1: CGPointMake(128.59, 127.18) controlPoint2: CGPointMake(119.83, 141.01)];
    [rwPath addCurveToPoint:CGPointMake(89.83, 187.86) controlPoint1: CGPointMake(98.79, 174.52) controlPoint2: CGPointMake(90.02, 188.06)];
    [rwPath addCurveToPoint:CGPointMake(56.52, 108.28) controlPoint1: CGPointMake(89.24, 187.23) controlPoint2: CGPointMake(56.56, 109.11)];
    [rwPath addCurveToPoint:CGPointMake(64.02, 102.25) controlPoint1: CGPointMake(56.47, 107.75) controlPoint2: CGPointMake(59.24, 105.56)];
    [rwPath addCurveToPoint:CGPointMake(101.42, 67.57) controlPoint1: CGPointMake(81.99, 89.78) controlPoint2: CGPointMake(93.92, 78.72)];
    [rwPath addCurveToPoint:CGPointMake(108.38, 30.65)  controlPoint1: CGPointMake(110.28, 54.47) controlPoint2: CGPointMake(113.01, 39.96)];
    [rwPath addCurveToPoint:CGPointMake(10.35, 0.41) controlPoint1: CGPointMake(99.66, 13.17) controlPoint2: CGPointMake(64.11, 2.16)];
     [rwPath addLineToPoint:CGPointMake(0.22, 0.07)];
     [rwPath addLineToPoint:CGPointMake(0.22, 124.79)];
     [rwPath closePath];
}
- (void) setUpRWLayer:(CAShapeLayer*)rwLayer path:(UIBezierPath*)rwPath{
    rwLayer.path = rwPath.CGPath;
    rwLayer.fillColor = [UIColor colorWithRed:11/255.0 green:86/255.0 blue:14/255.0 alpha:1].CGColor;
    rwLayer.fillRule = kCAFillRuleNonZero;
    rwLayer.lineCap = kCALineCapButt;
    rwLayer.lineDashPattern = nil;
    rwLayer.lineDashPhase = 0.0;
    rwLayer.lineJoin = kCALineJoinMiter;
    rwLayer.lineWidth = 1.0;
    rwLayer.miterLimit = 10.0;
    rwLayer.strokeColor =   [UIColor colorWithRed:11/255.0 green:86/255.0 blue:14/255.0 alpha:1].CGColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
