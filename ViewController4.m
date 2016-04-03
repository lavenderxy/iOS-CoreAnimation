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

@synthesize imageView,animate6;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animate7:(id)sender {
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
