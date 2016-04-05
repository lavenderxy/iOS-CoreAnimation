//
//  ViewController5.m
//  coreAnimaSY
//
//  Created by Xinyu Yan on 4/3/16.
//  Copyright © 2016 Xinyu Yan. All rights reserved.
//

/*
1. 创建一个uidynamicanimator，大部分情况下只需要一个animator；
2. 创建一个或多个uidynamic behavior, 并添加到animator;
3. 为dynamic behavior 添加 dynamic item
*/


#import "ViewController5.h"

@interface ViewController5 ()

@property (strong,nonatomic) UIDynamicAnimator *animator;

@end

@implementation ViewController5

@synthesize imageView,collision,snapBtn;

-(UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reset{
    [self.animator removeAllBehaviors];
    imageView.center = CGPointMake(80, 106);
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)snap:(id)sender {
    [self reset];
    UISnapBehavior *snapbehavior = [[UISnapBehavior alloc] initWithItem:imageView snapToPoint:self.view.center];
    snapbehavior.damping = 0.65;   //动画结束时的震荡值
    [self.animator addBehavior:snapbehavior];
}

- (IBAction)Collision:(id)sender {
    [self reset];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] init];
    [gravityBehavior addItem:imageView];
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] init];
    itemBehavior.resistance = 0.2;
    UICollisionBehavior *collistionBehavior = [[UICollisionBehavior alloc] init];
    [collistionBehavior addItem:imageView];
    collistionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [collistionBehavior addBoundaryWithIdentifier:@"Button" forPath:[UIBezierPath bezierPathWithRect:snapBtn.frame]];
    [self.animator addBehavior:collistionBehavior];
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:gravityBehavior];
    
}

- (IBAction)gravity:(id)sender {
    [self reset];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] init];
//    gravityBehavior.angle = M_PI_2;  //重力的方向（由弧度指定）
    gravityBehavior.gravityDirection = CGVectorMake(0, 1);  //重力的方向（由vector指定）
    gravityBehavior.magnitude = 0.5;   //重力加速度
    [gravityBehavior addItem:imageView];
    [self.animator addBehavior:gravityBehavior];
    
}
- (IBAction)attach:(id)sender {
    [self reset];
    UIAttachmentBehavior *attachBeahavior =[[UIAttachmentBehavior alloc] initWithItem:imageView attachedToAnchor:CGPointMake(CGRectGetMidX(self.view.frame), 106)];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[imageView]];
    [self.animator addBehavior:attachBeahavior];
    [self.animator addBehavior:gravityBehavior];
}
- (IBAction)push:(id)sender {
    [self reset];
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[imageView] mode:UIPushBehaviorModeInstantaneous];
    push.pushDirection = CGVectorMake(45, 0);
    push.magnitude = 1.0;
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[imageView]];
    itemBehavior.resistance = 0.8;
    [self.animator addBehavior:itemBehavior];
    [self.animator addBehavior:push];
    
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
