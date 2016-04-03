//
//  ViewController4.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 4/2/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

@synthesize imageView,animate6,imageView1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imageView.hidden = NO;
    imageView1.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animate7:(id)sender {
    imageView.hidden = NO;
    imageView1.hidden = YES;
    imageView.center = self.view.center;
    imageView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    imageView.alpha = 0.0;
    animate6.enabled = NO;
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         imageView.alpha = 1.0;
                     } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.0
                                  delay:2.0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 imageView.center = CGPointMake(imageView.center.x+CGRectGetWidth(self.view.frame), imageView.center.y);
                             } completion:^(BOOL finished) {
//                                 [imageView removeFromSuperview];
                                 animate6.enabled = YES;
                             }];
        }
    }];
    
}

- (IBAction)animate8:(id)sender {
    imageView1.hidden = NO;
    imageView.hidden = YES;
    imageView1.center = self.view.center;
    CABasicAnimation *layerAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    layerAnimation.duration = 2.0;
    layerAnimation.timingFunction = [CAMediaTimingFunction
                                     functionWithName:kCAMediaTimingFunctionLinear];
    layerAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 1)];
    layerAnimation.removedOnCompletion = NO;
    layerAnimation.fillMode = kCAFillModeForwards;
    [imageView1.layer addAnimation:layerAnimation forKey:@"layerAnimation"];
    [UIView animateWithDuration:2.0
                     animations:^{
                         imageView1.alpha = 0.2;
                     } completion:^(BOOL finished) {
                         imageView1.alpha = 1.0;
//                         imageView1.center = self.view.center;
//                         
//                         CABasicAnimation *layerAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
//                         layerAnimation1.duration = 1.0;
//                         layerAnimation1.timingFunction = [CAMediaTimingFunction
//                                                          functionWithName:kCAMediaTimingFunctionLinear];
//                         layerAnimation1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-M_PI, 1, 1, 1)];
//                         layerAnimation1.removedOnCompletion = NO;
//                         layerAnimation1.fillMode = kCAFillModeBackwards;
//                         [imageView1.layer addAnimation:layerAnimation1 forKey:@"layerAnimation"];
                         
                         
//                         [UIView transitionFromView:imageView1
//                                             toView:imageView1
//                                           duration:1.0
//                                            options:UIViewAnimationOptionTransitionCurlUp
//                                         completion:^(BOOL finished) {
////                                             imageView1=nil;
//                                         }];
                     }];
    
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
