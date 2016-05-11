//
//  EmitterController.m
//  testLayer
//
//  Created by zhuyun on 16/5/11.
//  Copyright © 2016年 codera. All rights reserved.
//

#import "EmitterController.h"

@interface EmitterController ()

@end

@implementation EmitterController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAEmitterLayer* emitterLayer = [CAEmitterLayer new];
    CAEmitterCell* emitterCell = [CAEmitterCell new];
    [self setUpEmitterLayer:emitterLayer];
    [self setUpEmitterCell:emitterCell];
    emitterLayer.emitterCells = [NSArray arrayWithObjects:emitterCell, nil];
    [self.view.layer addSublayer:emitterLayer];
}
- (void)setUpEmitterLayer:(CAEmitterLayer*)emitterLayer{
    emitterLayer.frame = self.view.bounds;
    emitterLayer.seed = [[NSDate new] timeIntervalSince1970];
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.drawsAsynchronously = true;
    [self setEmitterPosition:emitterLayer];
}
- (void)setEmitterPosition:(CAEmitterLayer*)emitterLayer{
    emitterLayer.emitterPosition = CGPointMake(CGRectGetMidX(self.view.bounds),CGRectGetMidY(self.view.bounds));
}
- (void)setUpEmitterCell:(CAEmitterCell*)emitterCell {
    emitterCell.contents = (id)[UIImage imageNamed:@"star"].CGImage;
    emitterCell.velocity = 50.0;
    emitterCell.velocityRange = 500.0;
    
    emitterCell.color = [UIColor blackColor].CGColor;
    emitterCell.redRange = 1.0;
    emitterCell.greenRange = 1.0;
    emitterCell.blueRange = 1.0;
    emitterCell.alphaRange = 0.0;
    emitterCell.redSpeed = 0.0;
    emitterCell.greenSpeed = 0.0;
    emitterCell.blueSpeed = 0.0;
    emitterCell.alphaSpeed = -0.5;
    
    CGFloat zeroDegreesInRadians = [self degreesToRadians:0.0];
    emitterCell.spin =[self degreesToRadians:130.0];
    emitterCell.spinRange = zeroDegreesInRadians;
    emitterCell.emissionRange = [self degreesToRadians:360.0];
    
    emitterCell.lifetime = 1.0;
    emitterCell.birthRate = 250.0;
    emitterCell.xAcceleration = -800.0;
    emitterCell.yAcceleration = 1000.0;
}
- (CGFloat)degreesToRadians:(double)degrees{
    return degrees * M_PI / 180.0;
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
