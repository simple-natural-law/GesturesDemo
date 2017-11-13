//
//  LongPressGestureViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/13.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "LongPressGestureViewController.h"

@interface LongPressGestureViewController ()

@end

@implementation LongPressGestureViewController

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    
    longPress.minimumPressDuration = 0.6; // 最短持续触摸时间
    
    [self.view addGestureRecognizer:longPress];
}

- (void)longPressAction:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        [self becomeFirstResponder];
        
        NSString *menuItemTitle = @"Reset";
        
        SEL action = @selector(reset:);
        
        UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:menuItemTitle action:action];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        menu.menuItems = @[menuItem];
        
        CGPoint location = [gestureRecognizer locationInView:self.view];
        
        CGRect rect = CGRectMake(location.x, location.y, 0, 0);
        
        [menu setTargetRect:rect inView:self.view];
        
        [menu setMenuVisible:YES animated:YES];
    }
}

- (void)reset:(UIMenuController *)menu
{
    [menu setMenuVisible:NO animated:YES];
    
    [self resignFirstResponder];
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
