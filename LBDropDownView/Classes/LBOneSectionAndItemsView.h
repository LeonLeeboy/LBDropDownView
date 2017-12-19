//
//  LBOneSectionAndItemsView.h
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBDropDownConst.h"

@protocol LBDropDownOneSectionDelegate <NSObject>

- (void)dropDownOneSectionIndex:(NSInteger)sectionIndex itemIndex:(NSInteger)itemIndex;

@end

@class LBDropDownGroupNameModel;
@interface LBOneSectionAndItemsView : UIView

@property (nonatomic , assign) CGFloat sectionIndex;

@property (nonatomic , weak) id <LBDropDownOneSectionDelegate> delegate;

@property (copy , nonatomic , readonly) LBDropDownGroupNameModel  *contentModel;
@property (assign , nonatomic) CGFloat dorDownGrounHeight;
+ (instancetype)viewWithmodel:(LBDropDownGroupNameModel *)model;
- (void)refreshUIWithModel:(LBDropDownGroupNameModel *)item;
@end
