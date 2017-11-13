//
//  HomeViewController.m
//  GesturesDemo
//
//  Created by 讯心科技 on 2017/11/8.
//  Copyright © 2017年 讯心科技. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

@end


@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"手势识别器Demo";
    
    self.dataSource = @[@{@"title":@"点击手势", @"target":@"TapGesturesViewController"},
                        @{@"title":@"长按手势", @"target":@"LongPressGestureViewController"},
                        @{@"title":@"拖拽手势", @"target":@"PanGestureViewController"},
                        @{@"title":@"轻扫手势", @"target":@"SwipGestureViewController"},
                        @{@"title":@"捏合手势", @"target":@"PinchGestureViewController"},
                        @{@"title":@"旋转手势", @"target":@"RotationGestureViewController"},
                        @{@"title":@"单击手势与双击手势冲突处理", @"target":@"SingleDoubleTapViewController"}];
}

#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:self.dataSource[indexPath.row][@"target"]];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
