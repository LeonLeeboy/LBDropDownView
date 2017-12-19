//
//  LBOneSectionAndItemsView.m
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "LBOneSectionAndItemsView.h"
#import "LBDropDownItemView.h"
#import "LBDropDownSectionView.h"
#import "LBDropDownModel.h"
#import "UIView+LBDropDownView.h"

@interface LBOneSectionAndItemsView()<LBDromDownItemViewDelegate>

@property (copy , nonatomic , readwrite) LBDropDownGroupNameModel *contentModel;

@property (weak , nonatomic) LBDropDownSectionView *headerView;

@property (strong , nonatomic) NSMutableArray<LBDropDownItemView *> *contentItemsView;


@end

@implementation LBOneSectionAndItemsView

- (NSMutableArray<LBDropDownItemView *> *)contentItemsView{
    if (!_contentItemsView) {
        _contentItemsView = [NSMutableArray array];
    }
    return _contentItemsView;
}

+ (instancetype)viewWithmodel:(LBDropDownGroupNameModel *)model{
    LBOneSectionAndItemsView *view = [[LBOneSectionAndItemsView alloc] init];
    view.contentModel = model;
    return view;
}

- (void)setContentModel:(LBDropDownGroupNameModel *)contentModel{
    if (contentModel == nil || contentModel == _contentModel) {
        return;
    }
    _contentModel = contentModel;
    [self prepareUIDependData:contentModel];
    [self refreshUIWithModel:contentModel];
}

- (void)prepareUIDependData:(LBDropDownGroupNameModel *)model{
    if (self.contentItemsView.count > 0) {
        [self.contentItemsView enumerateObjectsUsingBlock:^(LBDropDownItemView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
    }
    __weak typeof(self) weakSelf = self;
    [model.dropDownItems enumerateObjectsUsingBlock:^(LBDropDownItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LBDropDownItemView  *itemView = [LBDropDownItemView itemViewWithModel:obj];
        itemView.delegate = weakSelf;
        itemView.itemIndex = idx;
        [weakSelf addSubview:itemView];
        [weakSelf.contentItemsView addObject:itemView];
    }];
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

- (void)prepare {
    //data
    _contentModel = [[LBDropDownGroupNameModel alloc] init];
    _contentModel.content = @"";
    _contentModel.backgroundColor = [UIColor lightGrayColor];
    _contentModel.sectionHeight = 60;
    _contentModel.textColor = [UIColor darkGrayColor];
    //UI
    LBDropDownSectionView *headerView = [LBDropDownSectionView sectionViewWithTitle:_contentModel];
    [self addSubview:headerView];
    self.headerView = headerView;
}

- (void)refreshUIWithModel:(LBDropDownGroupNameModel *)item{
    __block CGFloat totalHeight = 0;
    [self.headerView refreshUIWithModel:item];
    totalHeight += item.sectionHeight;
    [self.contentItemsView enumerateObjectsUsingBlock:^(LBDropDownItemView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LBDropDownItem *dropDownItemTemp = [item.dropDownItems objectAtIndex:idx];
        [obj refreshUIWithModel:dropDownItemTemp];
        totalHeight += dropDownItemTemp.itemHeight;
    }];
    self.dorDownGrounHeight = totalHeight;
}

- (void)layoutSubviews{
    [self placeSubViews];
    [super layoutSubviews];

}

- (void)placeSubViews{
    CGFloat headerViewFrameX = 0;
    CGFloat headerViewFrameY = 0;
    CGFloat headerViewFrameW = self.LB_width;
    CGFloat headerViewFrameH = 0;
    if (self.contentModel.content == nil || [self.contentModel.content isEqualToString:@""]) {
        headerViewFrameH = 0;
    }else{
        headerViewFrameH = self.contentModel.sectionHeight;
    }
    
    CGRect headerViewFrame = CGRectMake(headerViewFrameX, headerViewFrameY, headerViewFrameW, headerViewFrameH);
    self.headerView.frame = headerViewFrame;
    
    
    __block LBDropDownItemView *preViousOBj = nil;
    if (self.contentItemsView.count > 0) {
        
        LBDropDownItemView *firstDropDownItemView = self.contentItemsView.firstObject;
        CGFloat firstDropDownItemViewX = 0;
        CGFloat firstDropDownItemViewY = headerViewFrameH + headerViewFrameY + itemSpace;
        CGFloat firstDropDownItemViewW = self.LB_width;
        CGFloat firstDropDownItemViewH = self.contentModel.dropDownItems.firstObject.itemHeight;
        firstDropDownItemView.frame = CGRectMake(firstDropDownItemViewX, firstDropDownItemViewY, firstDropDownItemViewW, firstDropDownItemViewH);
        preViousOBj = firstDropDownItemView;
    }
    __weak typeof(self) weakSelf = self;
    [self.contentItemsView enumerateObjectsUsingBlock:^(LBDropDownItemView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx > 0) {
            CGFloat DropDownItemViewX = preViousOBj.LB_x;
            CGFloat DropDownItemViewY = preViousOBj.LB_y + preViousOBj.LB_height + itemSpace;
            CGFloat DropDownItemViewW = weakSelf.LB_width;
            CGFloat DropDownItemViewH = weakSelf.contentModel.dropDownItems.firstObject.itemHeight;
            obj.frame = CGRectMake(DropDownItemViewX, DropDownItemViewY, DropDownItemViewW, DropDownItemViewH);
            preViousOBj = obj;
        }
    }];
    
    
}


#pragma mark lbDropDownItemDelegate
- (void)DropDownViewDidClickItemAtIndex:(NSInteger)intemIndex{
    if ([self.delegate respondsToSelector:@selector(dropDownOneSectionIndex:itemIndex:)]) {
        [self.delegate dropDownOneSectionIndex:self.sectionIndex itemIndex:intemIndex];
    }
}

@end
