//
//  ViewController.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 3/31/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    BOOL isFirst;
}

@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isFirst = true;
}
- (IBAction)startAnimation:(id)sender {
    if (!isFirst) {
        imageView.layer.position = CGPointMake(imageView.layer.position.x-100, imageView.layer.position.y);

    }
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(imageView.layer.position.x);
    animation.toValue = @(self.imageView.layer.position.x + 100);
//    animation.byValue = @(100);
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [imageView.layer addAnimation:animation forKey:@"basic"];
    
    imageView.layer.position = CGPointMake(imageView.layer.position.x+100, imageView.layer.position.y);
    
    isFirst = false;
    
}
- (IBAction)startOnFrame:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    NSInteger initalPositionX = self.imageView.layer.position.x;
    animation.values = @[@(initalPositionX),
                         @(initalPositionX+10),
                         @(initalPositionX-10),
                         @(initalPositionX+10),
                         @(initalPositionX)];
    animation.keyTimes = @[@(0),
                           @(1/6.0),
                           @(3/6.0),
                           @(5/6.0),
                           @(1)];
    [imageView.layer addAnimation:animation forKey:@"keyFrame"];
    
}


- (IBAction)startRotate:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    //Create Path
    CGMutablePathRef mutablepath = CGPathCreateMutable();
    CGPathMoveToPoint(mutablepath, nil, imageView.layer.position.x, imageView.layer.position.y);
    CGPathAddLineToPoint(mutablepath, nil, 200, 200);
    CGPathAddArc(mutablepath, nil, 200, 200, 100, 0, M_PI,YES);
    //set path
    animation.path = mutablepath;
    animation.duration = 4.0;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:animation forKey:@"PathAnimation"];
    
    //change opacity
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animation];
    opacityAnimation.keyPath = @"opacity";
    opacityAnimation.values = @[@(1.0),
                                @(0.5),
                                @(0.0),
                                @(0.5),
                                @(1.0)];
    opacityAnimation.calculationMode = kCAAnimationPaced;
    [imageView.layer addAnimation:opacityAnimation forKey:@"OpacityAnimation"];
    
    //set animation group
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation,opacityAnimation];
    animationGroup.duration = 4.0;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeBackwards;
    [imageView.layer addAnimation:animationGroup forKey:@"GroupAnimation"];
    
    
}


-(void)ddddd{

}
































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
