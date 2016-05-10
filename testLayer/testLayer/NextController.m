//
//  NextController.m
//  testLayer
//
//  Created by zhuyun on 16/5/10.
//  Copyright © 2016年 codera. All rights reserved.
//

#import "NextController.h"

@interface NextController ()
@property (nonatomic,strong) CAReplicatorLayer* replicator;
@property (nonatomic,strong) CALayer* bar;
@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated{
    [self addAnimation3];
}
- (void)addAnimation1{
    _replicator = [CAReplicatorLayer new];
    _replicator.bounds = CGRectMake(0.0,0.0,200.0, 200.0);
    _replicator.position = self.view.center;
   // _replicator.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:_replicator];
        _bar = [CALayer new];
        _bar.bounds = CGRectMake(0, 0, 8, 70);
        _bar.position = CGPointMake(10 , 215);
        _bar.cornerRadius = 2;
        _bar.backgroundColor = [UIColor redColor].CGColor;
        [_replicator addSublayer:_bar];
        CABasicAnimation* move = [CABasicAnimation animationWithKeyPath:@"position.y"];
        move.toValue = @(_bar.position.y-35.0);
        move.duration = 0.5;
        move.autoreverses = true;
        move.repeatCount = HUGE_VALF;
        [_bar addAnimation:move forKey:nil];
        _replicator.instanceCount = 15;
    _replicator.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    _replicator.instanceDelay =  0.33;
    _replicator.masksToBounds = true;
}
- (void)addAnimation2{
    _replicator = [CAReplicatorLayer new];
    _replicator.bounds = CGRectMake(0.0,0.0,200.0, 200.0);
    _replicator.position = self.view.center;
    _replicator.backgroundColor = [UIColor lightGrayColor].CGColor;
    _replicator.cornerRadius = 10;
    [self.view.layer addSublayer:_replicator];
    CALayer* dot = [CALayer new];
    dot.bounds = CGRectMake(0, 0, 14, 14);
    dot.position = CGPointMake(100 , 40);
    dot.cornerRadius = 2;
    dot.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor;
    dot.borderColor = [UIColor whiteColor].CGColor;
    dot.borderWidth = 1;
    dot.cornerRadius = 2;
    [_replicator addSublayer:dot];
    CFTimeInterval  duration = 1.5;
    
    CABasicAnimation* shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.1);
    shrink.duration = duration;
    shrink.repeatCount = HUGE_VALF;
    [dot addAnimation:shrink forKey:nil];
    int nrDots = 15;
    _replicator.instanceCount = nrDots;
    CGFloat angle = (CGFloat)2*M_PI / (CGFloat)nrDots;
    _replicator.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    _replicator.instanceDelay =  duration/(double)nrDots;
    _replicator.masksToBounds = true;
    dot.transform = CATransform3DMakeScale(0.01,0.01,0.01);
}
- (void)addAnimation3{
    _replicator = [CAReplicatorLayer new];
    _replicator.bounds = self.view.bounds;//CGRectMake(0.0,0.0,200.0, 200.0);
    _replicator.position = self.view.center;
    _replicator.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75].CGColor;
    [self.view.layer addSublayer:_replicator];
    CALayer* dot = [CALayer new];
    dot.bounds = CGRectMake(0, 0, 10, 10);
    dot.position = CGPointMake(100 , 40);
    dot.cornerRadius = 5;
    dot.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8].CGColor;
    dot.borderColor = [UIColor whiteColor].CGColor;
    dot.borderWidth = 1;
    dot.shouldRasterize = YES;
    dot.rasterizationScale = [UIScreen mainScreen].scale;
    [_replicator addSublayer:dot];
    CAKeyframeAnimation* move = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    move.path = [self thridPath];
    move.duration = 4.0;
    move.repeatCount = HUGE_VALF;
    [dot addAnimation:move forKey:nil];
    _replicator.instanceCount = 20;
    _replicator.instanceDelay =  0.1;
    _replicator.instanceColor = [UIColor greenColor].CGColor;
    _replicator.instanceGreenOffset = -0.03;
    _replicator.instanceRedOffset = 0.03;
    _replicator.instanceBlueOffset = 0.03;
}
- (CGPathRef)thridPath{
    UIBezierPath* bezierPath = [UIBezierPath new];
    [bezierPath moveToPoint: CGPointMake(31.5, 71.5)];
    [bezierPath addLineToPoint: CGPointMake(31.5, 23.5)];
    [bezierPath addCurveToPoint: CGPointMake(58.5, 38.5) controlPoint1:CGPointMake(31.5, 23.5) controlPoint2: CGPointMake(62.46, 18.69) ] ;
    [bezierPath addCurveToPoint: CGPointMake(53.5, 45.5) controlPoint1:CGPointMake(57.5, 43.5) controlPoint2: CGPointMake(53.5, 45.5) ] ;
    [bezierPath addLineToPoint: CGPointMake(43.5, 48.5)];
    [bezierPath addLineToPoint: CGPointMake(53.5, 66.5)];
    [bezierPath addLineToPoint: CGPointMake(62.5, 51.5)];
    [bezierPath addLineToPoint: CGPointMake(70.5, 66.5)];
    [bezierPath addLineToPoint: CGPointMake(86.5, 23.5)];
    [bezierPath addLineToPoint: CGPointMake(86.5, 78.5)];
    [bezierPath addLineToPoint: CGPointMake(31.5, 78.5)];
    [bezierPath addLineToPoint: CGPointMake(31.5, 71.5)];
    [bezierPath closePath];
    CGAffineTransform  t = CGAffineTransformMakeScale(3.0, 3.0);
    return CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &t);
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
