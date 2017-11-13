//
//  TapGesturesViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/13.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "TapGesturesViewController.h"

@interface TapGesturesViewController ()

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation TapGesturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    tap.numberOfTapsRequired = 1; // 点击次数
    tap.numberOfTouchesRequired = 1; // 点击的手指个数
    
    [self.view addGestureRecognizer:tap];
}

- (void)tapAction:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint location = [gestureRecognizer locationInView:self.view];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.targetView.center = location;
        }];
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
