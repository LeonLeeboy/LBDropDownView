//
//  LBDropDownSectionView.m
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "LBDropDownSectionView.h"
#import "LBDropDownModel.h"
#import "UIView+LBDropDownView.h"

@interface LBDropDownSectionView()

@property (copy , nonatomic , readwrite) LBDropDownGroupNameModel *contentModel;

@property (weak , nonatomic , readwrite) UILabel *labTitle;

@end

@implementation LBDropDownSectionView

+ (instancetype)sectionViewWithTitle:(LBDropDownGroupNameModel *)contentModel{
    LBDropDownSectionView *view = [[LBDropDownSectionView alloc] init];
    view.contentModel = contentModel;
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self prepare];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self prepare];
    }
    return self;
}

- (void)setContentModel:(LBDropDownGroupNameModel *)contentModel{
    if (contentModel == nil || contentModel == _contentModel) {
        return;
    }
    _contentModel = contentModel;
    [self refreshUIWithModel:contentModel];
}

- (void)refreshUIWithModel:(LBDropDownGroupNameModel *)item{
    self.labTitle.text = item.content;
}

- (void)prepare{
    //data
    _contentModel = [[LBDropDownGroupNameModel alloc] init];
   
    _contentModel.content = @"";
    _contentModel.backgroundColor = [UIColor lightGrayColor];
    _contentModel.sectionHeight = 60;
    _contentModel.textColor = [UIColor darkGrayColor];
    //UI
    self.backgroundColor = _contentModel.backgroundColor;
    
    UILabel *labTitle = [[UILabel alloc] init];
    labTitle.textAlignment = NSTextAlignmentLeft;
    labTitle.textColor = _contentModel.textColor;
    labTitle.font = [UIFont systemFontOfSize:14];
    labTitle.text = _contentModel.content;
    [self addSubview:labTitle];
    self.labTitle = labTitle;
}

- (void)layoutSubviews{
    [self placeSubViews];
    [super layoutSubviews];
}

- (void)placeSubViews{
   
    self.labTitle.frame = self.bounds;
}

@end
