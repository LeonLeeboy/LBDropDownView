//
//  LBDropDownItemView.m
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "LBDropDownItemView.h"
#import "LBDropDownModel.h"
#import "UIView+LBDropDownView.h"

@interface LBDropDownItemView ()

@property (nonatomic , strong  , readwrite) LBDropDownItem *itemModel;

@property (weak , nonatomic , readwrite) UILabel *labTitle;

@property (weak , nonatomic) UIImageView *iconView;

@end

@implementation LBDropDownItemView

+ (instancetype)itemViewWithModel:(LBDropDownItem *)model{
    LBDropDownItemView *view = [[LBDropDownItemView alloc] init];
    view.itemModel = model;
    return view;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self prepare];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)prepare{
    //data
    _itemModel.unselectedImageName = @"";
    _itemModel.selectedImageName = @"";
    _itemModel.content = @"";
    _itemModel.backgroundColor = [UIColor whiteColor];
    _itemModel.itemHeight = itemHeight;
    _itemModel.textColor = [UIColor darkGrayColor];
    _itemModel.font = [UIFont systemFontOfSize:14];
    //UI
    UILabel *labTitle = [[UILabel alloc] init];
    labTitle.textAlignment = NSTextAlignmentLeft;
    labTitle.textColor = _itemModel.textColor;
    labTitle.font = _itemModel.font;
    labTitle.text = _itemModel.content;
    [self addSubview:labTitle];
    self.labTitle = labTitle;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_itemModel.unselectedImageName]];
    [self addSubview:imageView];
    self.iconView = imageView;
    self.backgroundColor = _itemModel.backgroundColor;
    [self addTarget: self action:@selector(didSelectItem) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didSelectItem{
    if ([self.delegate respondsToSelector:@selector(DropDownViewDidClickItemAtIndex:)]) {
        [self.delegate DropDownViewDidClickItemAtIndex:self.itemIndex];
    }
}


- (void)setItemModel:(LBDropDownItem *)itemModel{
    if (itemModel == nil || itemModel == _itemModel) {
        return;
    }
    _itemModel = itemModel;
    [self refreshUIWithModel:itemModel];
}


- (void)refreshUIWithModel:(LBDropDownItem *)item{
    self.labTitle.text = item.content;
    if (item.selected) {
        self.iconView.image = [UIImage imageNamed:item.selectedImageName];
    }else{
        self.iconView.image = [UIImage imageNamed:item.unselectedImageName];
    }
    self.backgroundColor = item.backgroundColor;
}

- (void)layoutSubviews{
    [self placeSubViews];
    [super layoutSubviews];
}

- (void)placeSubViews{
    
    //icon view frame
    CGFloat padding = 5;
    self.iconView.LB_height = self.LB_height - 2 * padding;
    self.iconView.LB_width = self.iconView.LB_height;
    self.iconView.LB_x = padding;
    self.iconView.LB_y = (self.LB_height - self.iconView.LB_height)/2.0;
    
     // lab frame
    self.labTitle.LB_x = self.iconView.LB_x + self.iconView.LB_width + 5;
    self.labTitle.LB_y = self.iconView.LB_y;
    self.labTitle.LB_height = self.iconView.LB_height;
    self.labTitle.LB_width = self.LB_width - self.labTitle.LB_x - padding;
}

@end
