//
//  LBDropDownSectionView.h
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LBDropDownGroupNameModel;
@interface LBDropDownSectionView : UIView

@property (copy , nonatomic , readonly) LBDropDownGroupNameModel  *contentModel;

+ (instancetype)sectionViewWithTitle:(LBDropDownGroupNameModel *)model;

- (void)refreshUIWithModel:(LBDropDownGroupNameModel *)item;

@end
