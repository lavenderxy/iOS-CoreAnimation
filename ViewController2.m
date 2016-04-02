//
//  ViewController2.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 4/2/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

@synthesize imageView,imageView1,containView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    imageView1.hidden = YES;
    imageView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animation3:(id)sender {
    
//    [UIView beginAnimations:@"AnimateInContainView" context:nil];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:containView cache:YES];
//    [UIView setAnimationDuration:1.0];
//    imageView1.hidden = !imageView1.hidden;
//    imageView.hidden = !imageView.hidden;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        containView.layer.transform = CATransform3DRotate(containView.layer.transform, M_PI_2, 0, 1, 0);} completion:^(BOOL finished){
            imageView1.hidden = !imageView1.hidden;
            imageView.hidden = !imageView.hidden;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                containView.layer.transform = CATransform3DRotate(containView.layer.transform, M_PI_2, 0, 1, 0);} completion:nil];
        
        }];
    
    
}
- (IBAction)ainmation4:(id)sender {
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
