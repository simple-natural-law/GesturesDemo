//
//  MultipleGesturesViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/14.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "MultipleGesturesViewController.h"

@interface MultipleGesturesViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end


@implementation MultipleGesturesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    pan.delegate = self;
    [self.targetView addGestureRecognizer:pan];
    
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    pinch.delegate = self;
    [self.targetView addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    rotation.delegate = self;
    [self.targetView addGestureRecognizer:rotation];
    
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


- (void)pinchAction:(UIPinchGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        self.targetView.transform = CGAffineTransformMakeScale(gestureRecognizer.scale, gestureRecognizer.scale);
    }
}


- (void)rotationAction:(UIRotationGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        self.targetView.transform = CGAffineTransformMakeRotation(gestureRecognizer.rotation);
    }
}

#pragma mark- UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 允许同时识别在同一视图上的特定手势
    if (gestureRecognizer.view == self.targetView && otherGestureRecognizer.view == self.targetView)
    {
        if (![gestureRecognizer isMemberOfClass:[UILongPressGestureRecognizer class]] && ![otherGestureRecognizer isMemberOfClass:[UILongPressGestureRecognizer class]])
        {
            return YES;
        }
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
