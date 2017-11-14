//
//  SwipPanViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/14.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "SwipPanViewController.h"

@interface SwipPanViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *targetView;

@property (strong, nonatomic) UISwipeGestureRecognizer *swip;

@property (strong, nonatomic) UIPanGestureRecognizer *pan;

@end


@implementation SwipPanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    
    self.swip.direction = UISwipeGestureRecognizerDirectionDown;
    
    self.swip.delegate = self;
    
    [self.targetView addGestureRecognizer:self.swip];
    
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.targetView addGestureRecognizer:self.pan];
    
}

- (void)swipAction:(UISwipeGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            self.targetView.transform = CGAffineTransformTranslate(self.targetView.transform, 0, 40.0);
        }];
    }
}


- (void)panAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gestureRecognizer translationInView:self.view];
        
        self.targetView.center = CGPointMake(self.targetView.center.x + translation.x, self.targetView.center.y + translation.y);
        
        [gestureRecognizer setTranslation:CGPointZero inView:self.view];
    }
}

#pragma mark- UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.swip && otherGestureRecognizer == self.pan)
    {
        return YES;
    }
    return NO;
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
