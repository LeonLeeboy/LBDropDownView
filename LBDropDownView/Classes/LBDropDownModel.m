//
//  LBDropDownModel.m
//  XSGeneration
//
//  Created by Leon on 2017/12/15.
//  Copyright © 2017年 Leon. All rights reserved.
//

#import "LBDropDownModel.h"

@interface LBDropDownModel ()
@property (nonatomic , strong , readwrite) NSArray <LBDropDownGroupNameModel *>*sectionModels;
@property (assign , nonatomic , readwrite) CGFloat height;
@end

@implementation LBDropDownModel
+ (instancetype)modelWithLBDropDownGroupNameModel:(NSArray<LBDropDownGroupNameModel *> *)models{
    LBDropDownModel *model = [[LBDropDownModel alloc] init];
    model.sectionModels = models;
    model.backGroundColor = [UIColor whiteColor];
    return model;
}

- (CGFloat)height{
    __block CGFloat h  = 0;
    [self.sectionModels enumerateObjectsUsingBlock:^(LBDropDownGroupNameModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        h += obj.totalHeght;
    }];
    h += (self.sectionModels.count - 1 ) * sectionSpace;
    return h;
}
@end



@interface LBDropDownGroupNameModel ()

@property (strong , nonatomic , readwrite) NSArray <LBDropDownItem *>*dropDownItems;

@property (assign , nonatomic,readwrite) CGFloat totalHeght;

@end

@implementation LBDropDownGroupNameModel

+ (instancetype)modelWithDropDownItems:(NSArray<LBDropDownItem *> *)dropDownItems{
        LBDropDownGroupNameModel *model = [[LBDropDownGroupNameModel alloc] init];
        model.dropDownItems = dropDownItems;
        model.backgroundColor = [UIColor whiteColor];
        model.textColor = [UIColor darkGrayColor];
        model.sectionHeight = 64;
        return model;
}



- (CGFloat)totalHeght{
    __block CGFloat temp = 0;
    if (self.content == nil || [self.content isEqualToString:@""]) {
        temp = 0;
    }else{
        temp += self.sectionHeight;
    }
    [self.dropDownItems enumerateObjectsUsingBlock:^(LBDropDownItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        temp += obj.itemHeight;
    }];
    temp += self.dropDownItems.count * itemSpace;
    return temp;
}

@end




@implementation LBDropDownItem

- (instancetype)init{
    if (self = [super init]) {
        self.unselectedImageName = @"";
        self.selectedImageName = @"";
        self.backgroundColor = [UIColor lightGrayColor];
        self.itemHeight = 44;
        self.textColor = [UIColor darkGrayColor];
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

@end
