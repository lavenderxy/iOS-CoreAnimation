//
//  ViewController1.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 4/1/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1{
    BOOL isRotate;
    CGPoint origin;
    CGAffineTransform origintransform;
    CGFloat originAlpha;
}

@synthesize imageview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    origin = imageview.center;
    origintransform = imageview.transform;
    originAlpha = imageview.alpha;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animate1:(id)sender {
    CGPoint oldCenter = imageview.center;
    CGAffineTransform oldtransform = imageview.transform;
    CGFloat oldAlpha = imageview.alpha;
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{imageview.center = self.view.center;
        imageview.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI), CGAffineTransformMakeScale(2.0, 2.0));imageview.alpha = 0.5;} completion:^(BOOL finished) {
            imageview.center = oldCenter;
            imageview.transform = oldtransform;
            imageview.alpha = oldAlpha;
        }];
    
}

- (IBAction)animate2:(id)sender {
//    imageview.center = origin;
//    imageview.transform = origintransform;
    [UIView beginAnimations:@"Animate 2" context:nil]; //配置动画的执行属性
    [UIView setAnimationDelay:0.5];  //延迟时间
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(willStart)];   //监听开始的事件
    [UIView setAnimationDidStopSelector:@selector(didStop)];       //监听结束的事件
    [UIView setAnimationDuration:2.0];       //执行时间
    [UIView setAnimationRepeatAutoreverses:YES];        //自动复原
    [UIView setAnimationRepeatCount:1.5];     //重复次数
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];  //执行的加速过程(加速开始，减速结束)
    [UIView setAnimationBeginsFromCurrentState:YES];    //是否由当前动画状态开始执行(处理同一个控件上一次动画还没有结束，这次动画就要开始的情况)
    //实际执行的动画
    imageview.center = self.view.center;
    imageview.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI), CGAffineTransformMakeScale(2.0, 2.0));
    imageview.alpha = 0.5;
    
    //提交动画
    [UIView commitAnimations];
    
}

-(void)willStart{
    NSLog(@"will start");
}

-(void)didStop{
    NSLog(@"did stop");
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
