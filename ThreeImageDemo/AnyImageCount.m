//
//  AnyImageCount.m
//  ThreeImageDemo
//
//  Created by 123 on 15/12/30.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import "AnyImageCount.h"
@implementation AnyImageCount

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //[self makeView];
    }
    return self;
}
- (void)makeViewWith:(AnyImageEntry *)anyImageEntry{
    self.backgroundColor = [UIColor redColor];
    //间隙
    float jianxi = 5*(anyImageEntry.iamgeCount.count+1);
    float width = (self.frame.size.width - jianxi)/anyImageEntry.iamgeCount.count;
    
    for (int i=0; i<anyImageEntry.iamgeCount.count; i++) {
        UIImageView *sonview = [[UIImageView alloc]initWithFrame:CGRectMake(5*(i+1)+width*i, 10, width, 30)];
        sonview.backgroundColor = [UIColor cyanColor];
        [self addSubview:sonview];
    }
}
@end
