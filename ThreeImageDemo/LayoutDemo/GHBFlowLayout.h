//
//  GHBFlowLayout.h
//  ThreeImageDemo
//
//  Created by 123 on 15/12/31.
//  Copyright © 2015年 haibin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GhbMetroHeaderFooterPosition) {
    GhbMetroHeaderFooterPositionVertical,        //header和footer在上下
    GhbMetroHeaderFooterPositionHorizontal       //header和footer在左右
};

@class GHBFlowLayout;
@protocol GhbTopicFlowLayoutDelegate <NSObject>

@required
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(GHBFlowLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath;
@end

@interface GHBFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSUInteger numberOfColumns;
@property (nonatomic, assign) CGFloat interItemSpacing;

@property (nonatomic, weak) id<GhbTopicFlowLayoutDelegate> delegate;

@end
