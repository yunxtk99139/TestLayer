//
//  TransfromController.m
//  testLayer
//
//  Created by zhuyun on 16/5/11.
//  Copyright © 2016年 codera. All rights reserved.
//

#import "TransfromController.h"
static   CGFloat sideLength = 160.0;
@interface TransfromController ()
@property (weak, nonatomic) IBOutlet UIView *tranView;

@end

@implementation TransfromController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    CATransformLayer* transformLayer = [CATransformLayer new];
    [self setUpTransformLayer:transformLayer ];
    [_tranView.layer addSublayer:transformLayer];
}
- (void)setUpTransformLayer:(CATransformLayer*)transformLayer {
    CALayer* layer = [self sideLayerWithColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
    [transformLayer addSublayer:layer];
    
    layer  = [self sideLayerWithColor:[UIColor orangeColor]];
    CATransform3D transform = CATransform3DMakeTranslation(sideLength / 2.0, 0.0, sideLength / -2.0);
    transform = CATransform3DRotate(transform, [self degreesToRadians:90.0], 0.0, 1.0, 0.0);
    layer.transform = transform;
     [transformLayer addSublayer:layer];
    
    layer = [self sideLayerWithColor:[UIColor yellowColor]];
    layer.transform = CATransform3DMakeTranslation(0.0, 0.0, -sideLength);
     [transformLayer addSublayer:layer];
    
    layer = [self sideLayerWithColor:[[UIColor greenColor] colorWithAlphaComponent:0.5]];
    transform = CATransform3DMakeTranslation(sideLength / -2.0, 0.0, sideLength / -2.0);
    transform = CATransform3DRotate(transform, [self degreesToRadians:90.0], 0.0, 1.0, 0.0);
    layer.transform = transform;
     [transformLayer addSublayer:layer];
    
    layer = [self sideLayerWithColor:[UIColor blueColor]];
    transform = CATransform3DMakeTranslation(0.0, sideLength / -2.0, sideLength / -2.0);
    transform = CATransform3DRotate(transform, [self degreesToRadians:90.0], 1.0, 0.0, 0.0);
    layer.transform = transform;
     [transformLayer addSublayer:layer];
    
    layer = [self sideLayerWithColor:[UIColor purpleColor]];
    transform = CATransform3DMakeTranslation(0.0, sideLength / 2.0, sideLength / -2.0);
    transform = CATransform3DRotate(transform, [self degreesToRadians:90.0], 1.0, 0.0, 0.0);
    layer.transform = transform;
   [transformLayer addSublayer:layer];
    
    transformLayer.anchorPointZ = sideLength / -2.0;
    [self applyRotationForXOffset:16 yOffset:16 layer:transformLayer];
}
- (CALayer*) sideLayerWithColor:(UIColor*)color{
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0,0, sideLength, sideLength);
    layer.position = CGPointMake( CGRectGetMidX(_tranView.bounds), CGRectGetMidY(_tranView.bounds));
    layer.backgroundColor = color.CGColor;
    return layer;
}
- (CGFloat)degreesToRadians:(double)degrees{
    return degrees * M_PI / 180.0;
}
- (void)applyRotationForXOffset:(double)xOffset yOffset:(double)yOffset layer:(CATransformLayer*)transformLayer{
    double totalOffset = sqrt(xOffset * xOffset + yOffset * yOffset);
    CGFloat totalRotation = totalOffset * M_PI / 180.0;
    CGFloat xRotationalFactor = totalOffset / totalRotation;
    CGFloat yRotationalFactor = totalOffset / totalRotation;
    CATransform3D currentTransform = CATransform3DTranslate(transformLayer.sublayerTransform, 0.0, 0.0, 0.0);
    CATransform3D rotationTransform = CATransform3DRotate(transformLayer.sublayerTransform, totalRotation,
                                                xRotationalFactor * currentTransform.m12 - yRotationalFactor * currentTransform.m11,
                                                xRotationalFactor * currentTransform.m22 - yRotationalFactor * currentTransform.m21,
                                                          xRotationalFactor * currentTransform.m32 - yRotationalFactor * currentTransform.m31);
    transformLayer.sublayerTransform = rotationTransform;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
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
