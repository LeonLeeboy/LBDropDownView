//
//  LBDropDownView.h
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBDropDownModel.h"

@class LBDropDownView;
@protocol LBDropDownViewDelegate <NSObject>

@required;
- (void)dropDownView:(LBDropDownView *)dropDownView didSelecteItemSectionIndex:(NSInteger)sectionIndex itemIndex:(NSInteger)itenIndex;

@end



@protocol LBDropDownViewDataSource <NSObject>

@optional
- (LBDropDownModel *)modelsForLBDropDownView:(LBDropDownView *)dropDownView;
@end





@interface LBDropDownView : UIView
//要么通过Delegate 和 datasource 配置，要么通过类方法初始化。

@property (strong  , nonatomic ,readonly) LBDropDownModel *dropDownModel;
@property (weak , nonatomic) id <LBDropDownViewDelegate> delegate;
@property (weak , nonatomic) id <LBDropDownViewDataSource> dataSource;

+ (instancetype)dropDownViewWithModel:(LBDropDownModel *)model;

@end
