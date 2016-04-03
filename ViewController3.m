//
//  ViewController3.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 4/2/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3{
    BOOL isFirstViewShow;
}

@synthesize imageView,imageView1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isFirstViewShow = true;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animate6:(id)sender {
    [UIView transitionFromView:(isFirstViewShow ? imageView : imageView1)
                        toView:(isFirstViewShow? imageView1 : imageView)
                      duration:1.0
                       options:(isFirstViewShow ? UIViewAnimationOptionTransitionFlipFromRight:
                                UIViewAnimationOptionTransitionFlipFromLeft)
                    completion:^(BOOL finished) {
                        if (finished) {
                            isFirstViewShow = !isFirstViewShow;
                        }
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
