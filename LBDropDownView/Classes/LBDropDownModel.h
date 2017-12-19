//
//  LBDropDownModel.h
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBDropDownConst.h"


@interface LBDropDownItem : NSObject
//UI相关
@property (copy , nonatomic) NSString *unselectedImageName;
@property (copy , nonatomic) NSString *selectedImageName;
@property (strong , nonatomic) UIColor *backgroundColor;
@property (assign , nonatomic) CGFloat itemHeight;
@property (strong , nonatomic) UIColor *textColor;
@property (strong , nonatomic) UIFont *font;
//逻辑相关
@property (assign , nonatomic,getter=isSelected) BOOL selected;
//数据相关
@property (copy , nonatomic) NSString *content;

@end

@interface LBDropDownGroupNameModel : NSObject
//数据相关
@property (copy , nonatomic) NSString *content;
@property (strong , nonatomic , readonly) NSArray <LBDropDownItem *>*dropDownItems;
//UI相关
@property (strong , nonatomic) UIColor *backgroundColor;
@property (strong , nonatomic) UIColor *textColor;
@property (assign , nonatomic ) CGFloat sectionHeight;

@property (assign , nonatomic,readonly) CGFloat totalHeght;
//逻辑相关


+ (instancetype)modelWithDropDownItems:(NSArray <LBDropDownItem *>*)dropDownItems;

@end


@interface LBDropDownModel : NSObject

@property (nonatomic , strong , readonly) NSArray <LBDropDownGroupNameModel *>*sectionModels;

@property (assign , nonatomic , readonly) CGFloat height;

@property (strong , nonatomic) UIColor *backGroundColor;


+ (instancetype)modelWithLBDropDownGroupNameModel:(NSArray <LBDropDownGroupNameModel *>*)models;

@end


