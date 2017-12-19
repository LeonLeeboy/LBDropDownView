//
//  LBDropDownItemView.h
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LBDromDownItemViewDelegate <NSObject>

@optional
- (void)DropDownViewDidClickItemAtIndex:(NSInteger)intemIndex;

@end

@class LBDropDownItem;
@interface LBDropDownItemView : UIControl

@property (nonatomic , weak) id <LBDromDownItemViewDelegate> delegate;

@property (nonatomic , assign ) CGFloat itemIndex;

@property (nonatomic , strong  , readonly) LBDropDownItem *itemModel;

+ (instancetype)itemViewWithModel:(LBDropDownItem *)model;

- (void)refreshUIWithModel:(LBDropDownItem *)item;

@end
