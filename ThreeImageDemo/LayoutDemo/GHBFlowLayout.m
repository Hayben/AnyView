//
//  GHBFlowLayout.m
//  ThreeImageDemo
//
//  Created by 123 on 15/12/31.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import "GHBFlowLayout.h"

@interface GHBFlowLayout ()

@property (nonatomic, strong) NSMutableDictionary *lastYValueForColumn;
@property (nonatomic, strong) NSMutableDictionary *layoutInfo;

@end

@implementation GHBFlowLayout

//在集合视图开始布局之前调用，主要计算边框
- (void)prepareLayout{
    [super prepareLayout];
    self.numberOfColumns = 2;
    self.interItemSpacing = 0;
    
    self.lastYValueForColumn = [NSMutableDictionary dictionary];
    CGFloat currentColumn = 0;
    CGFloat fullWidth = self.collectionView.frame.size.width;
    CGFloat availableSpaceExcludingPadding = fullWidth - (self.interItemSpacing * (self.numberOfColumns + 1));
    CGFloat itemWidth = availableSpaceExcludingPadding / self.numberOfColumns;
    self.layoutInfo = [NSMutableDictionary dictionary];
    NSIndexPath *indexPath;
    NSInteger numSections = [self.collectionView numberOfSections];
    
    for (NSInteger section = 0; section < numSections; section ++) {
        NSInteger numitems = [self.collectionView numberOfItemsInSection:section];
        for (NSInteger item = 0; item < numitems; item ++) {
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            
            UICollectionViewLayoutAttributes *itemAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

            CGFloat x = self.interItemSpacing + (self.interItemSpacing + itemWidth) * currentColumn;
            
            CGFloat y = [self.lastYValueForColumn[@(currentColumn)] doubleValue];
            
            if (section == 1 && item < 2) {
                //在第二个section后加间隔
                y = y + 5;
            }
            if (section == 0 && item == 2) {
                x = self.interItemSpacing + itemWidth;
                y = 80;
            }
            if (section == 1 && item == 1) {
                y = y+80;
            }
//            CGFloat y = [self.lastYValueForColumn[@(currentColumn)] doubleValue];
            
            CGFloat height = [((id<GhbTopicFlowLayoutDelegate>)self.collectionView.delegate) collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
            
            itemAttributes.frame = CGRectMake(x, y, itemWidth, height);
            
            y += height;
            
            y += self.interItemSpacing;
            
            self.lastYValueForColumn[@(currentColumn)] = @(y);
            
            currentColumn ++;
            if (currentColumn == self.numberOfColumns) {
                currentColumn = 0;
            }
            if (section == 0 && item == 2) {
                currentColumn = 0;
            }
            self.layoutInfo[indexPath] = itemAttributes;
        }
    }
    //    NSLog(@"self.layoutInfo %@",self.layoutInfo);
    //    NSLog(@"self.lastYValueForColumn %@",self.lastYValueForColumn);
    
}
- (CGSize) collectionViewContentSize{
    NSUInteger currentColum = 0;
    CGFloat maxHeight = 0;
    do {
        CGFloat height = [self.lastYValueForColumn[@(currentColum)] doubleValue];
        if (height > maxHeight)
            maxHeight = height;
            currentColum ++;
    } while (currentColum < self.numberOfColumns) ;
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}
@end
