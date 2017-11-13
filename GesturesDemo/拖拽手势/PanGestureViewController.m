//
//  PanGestureViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/13.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "PanGestureViewController.h"

@interface PanGestureViewController ()

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation PanGestureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.targetView addGestureRecognizer:pan];
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
