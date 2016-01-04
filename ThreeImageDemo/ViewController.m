//
//  ViewController.m
//  ThreeImageDemo
//
//  Created by 123 on 15/12/30.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import "ViewController.h"
#import "AnyImageCount.h"
#import "AnyImageEntry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AnyImageCount *any = [[AnyImageCount alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 50)];
    AnyImageEntry *entry = [AnyImageEntry new];
    
#pragma mark ------  这里你可以改变任意的 数组元素
    entry.iamgeCount = @[@"1",@"2",@"3",@"1",@"2",@"3"];
    [any makeViewWith:entry];
    
    [self.view addSubview:any];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
