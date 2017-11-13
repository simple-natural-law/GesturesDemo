//
//  RotationGestureViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/13.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "RotationGestureViewController.h"

@interface RotationGestureViewController ()

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation RotationGestureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    
    [self.view addGestureRecognizer:rotation];
}


- (void)rotationAction:(UIRotationGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        self.targetView.transform = CGAffineTransformMakeRotation(gestureRecognizer.rotation);
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
