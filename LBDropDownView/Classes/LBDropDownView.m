//
//  LBDropDownView.m
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "LBDropDownView.h"
#import "LBOneSectionAndItemsView.h"
#import "LBDropDownModel.h"
#import "UIView+LBDropDownView.h"

@interface LBDropDownView ()<LBDropDownOneSectionDelegate>

@property (strong  , nonatomic ,readwrite) LBDropDownModel *dropDownModel;

@property (strong , nonatomic ) NSMutableArray <LBOneSectionAndItemsView *>*sectionViewsArray;

@property (weak , nonatomic) UIScrollView *scrollView;


@end

@implementation LBDropDownView

- (NSMutableArray<LBOneSectionAndItemsView *> *)sectionViewsArray{
    if (_sectionViewsArray == nil) {
        _sectionViewsArray = [NSMutableArray array];
    }
    return _sectionViewsArray;
}

+ (instancetype)dropDownViewWithModel:(LBDropDownModel *)model{
    LBDropDownView *view = [[LBDropDownView alloc] init];
    view.dropDownModel = model;
    return view;
}

/**
 for xib
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    [self prepare];
}

/**
 for pure code
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self prepare];
    }
    return self;
}

- (void)setDropDownModel:(LBDropDownModel *)dropDownModel{
    BOOL isNew = (dropDownModel == _dropDownModel)?NO:YES;
    BOOL isNIll = _dropDownModel == nil;
    BOOL isValid = isNIll && isNew;
    if (!isValid) {
        return;
    }
    _dropDownModel = dropDownModel;
    [self prepareUIWithData:dropDownModel];
    [self refreshUIWithModel:dropDownModel];
}

- (void)prepareUIWithData:(LBDropDownModel *)model{
    if (model.sectionModels.count <= 0) {
        return;
    }
    
    [model.sectionModels enumerateObjectsUsingBlock:^(LBDropDownGroupNameModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LBOneSectionAndItemsView *view = [LBOneSectionAndItemsView viewWithmodel:obj];
        view.delegate = self;
        view.sectionIndex = idx;
        [self.scrollView addSubview:view];
        [self.sectionViewsArray addObject:view];
    }];
    
    
   
}

- (void)refreshUIWithModel:(LBDropDownModel *)model{
    self.backgroundColor = model.backGroundColor;
    [self.sectionViewsArray enumerateObjectsUsingBlock:^(LBOneSectionAndItemsView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj refreshUIWithModel:[model.sectionModels objectAtIndex:idx]];
    }];
}



/**
 初始化
 */
- (void)prepare{
    //初始化数据
    
    //初始化UI结构
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.5;
    self.layer.cornerRadius = 3.0;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    if ([self.dataSource respondsToSelector: @selector(modelsForLBDropDownView:)]) {
        LBDropDownModel *dropDownModel = [self.dataSource modelsForLBDropDownView:self];
        self.dropDownModel = dropDownModel;
    }
}

- (void)layoutSubviews{
    [self placeViews];
    [super layoutSubviews];
}


- (void)placeViews{

    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(self.LB_width, self.dropDownModel.height);
    
    __block LBOneSectionAndItemsView *previos;
    if (self.sectionViewsArray.count > 0) {
        LBOneSectionAndItemsView *firstObj = self.sectionViewsArray.firstObject;
        CGFloat firstX = 0;
        CGFloat firstY = 0;
        CGFloat firstW = self.LB_width;
        CGFloat firstH = self.dropDownModel.sectionModels.firstObject.totalHeght;
        firstObj.frame = CGRectMake(firstX, firstY,firstW, firstH);
        previos = self.sectionViewsArray.firstObject;
    }
    __weak typeof(self) weakSelf = self;
    [self.sectionViewsArray enumerateObjectsUsingBlock:^(LBOneSectionAndItemsView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if (idx > 0) {
            
            CGFloat X = 0;
            CGFloat Y = previos.LB_y + previos.LB_height + sectionSpace;
            CGFloat W = previos.LB_width;
            CGFloat H = [weakSelf.dropDownModel.sectionModels objectAtIndex:idx].totalHeght;
            obj.frame = CGRectMake(X, Y, W, H);
            previos = obj;
        }
        
    }];
}

- (void)dropDownOneSectionIndex:(NSInteger)sectionIndex itemIndex:(NSInteger)itemIndex{
    self.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(dropDownView:didSelecteItemSectionIndex:itemIndex:)]) {
        [self.delegate dropDownView:self didSelecteItemSectionIndex:sectionIndex itemIndex:itemIndex];
    }
}

@end
