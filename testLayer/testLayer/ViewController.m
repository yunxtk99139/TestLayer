//
//  ViewController.m
//  testLayer
//
//  Created by zhuyun on 16/5/10.
//  Copyright © 2016年 codera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) CALayer* layer;
@property (strong, nonatomic) CAGradientLayer* gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _layer = _centerView.layer;
    [self setUpLayer];
    UIPinchGestureRecognizer* pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognized:)];
    _centerView.userInteractionEnabled = YES;
    [_centerView addGestureRecognizer:pin];
}
- (void)setUpLayer{
//    _gradientLayer = [[CAGradientLayer alloc]init];
//    _gradientLayer.frame = self.view.bounds;
//    _gradientLayer.colors = [(id)[NSArray alloc]initWithObjects:[UIColor colorWithRed:209 green:0 blue:0 alpha:1].CGColor,
//                            [UIColor colorWithRed:255 green:102 blue:21 alpha:1].CGColor,
//                            [UIColor colorWithRed:255 green:67 blue:0 alpha:1].CGColor,
//                            [UIColor colorWithRed:51 green:221 blue:0 alpha:1].CGColor,
//                            [UIColor colorWithRed:37 green:51 blue:204 alpha:1].CGColor,
//                            [UIColor colorWithRed:34 green:0 blue:102 alpha:1].CGColor,
//        [UIColor colorWithRed:51 green:0 blue:68 alpha:1].CGColor,nil];
//    _gradientLayer.startPoint = CGPointMake(0, 0);
//    _gradientLayer.endPoint = CGPointMake(0, 1);
//    [self.view.layer addSublayer:_gradientLayer ];
//    [self.view bringSubviewToFront:_centerView];
    _layer.backgroundColor = [UIColor blueColor].CGColor;
    _layer.borderWidth = 100;
    _layer.borderColor = [UIColor redColor].CGColor;
    _layer.shadowRadius = 10;
    _layer.shadowOffset = CGSizeMake(0, 0);
    _layer.shadowOpacity = 0.7;
    _layer.contents = (id )([UIImage imageNamed:@"testImage"].CGImage);
    _layer.contentsGravity = kCAGravityCenter;
}
- (void)pinchGestureRecognized:(UIPinchGestureRecognizer*)sender{
    NSLog(@"pin");
    CGFloat offset = sender.scale<1?2.0:-2.0;
    CGRect oldFrame = _centerView.frame;
    CGPoint oldOrigin = oldFrame.origin;
    CGPoint newOrigin = CGPointMake(oldOrigin.x+offset, oldOrigin.y+offset);
    CGRect newFrame = CGRectMake(newOrigin.x, newOrigin.y, oldFrame.size.width+(offset*-2.0), oldFrame.size.height+(offset*-2.0));
    if( newFrame.size.width >= 100.0 && newFrame.size.width <= 300.0 ){
        _layer.borderWidth -= offset;
        _layer.cornerRadius += (offset / 2.0);
        _layer.frame = newFrame;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
