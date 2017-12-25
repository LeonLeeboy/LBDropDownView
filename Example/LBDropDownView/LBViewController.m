//
//  LBViewController.m
//  LBDropDownView
//
//  Created by j1103765636@iCloud.com on 12/19/2017.
//  Copyright (c) 2017 j1103765636@iCloud.com. All rights reserved.
//

#import "LBViewController.h"
#import <LBDropDownView/LBDropDownView.h>



@interface LBViewController ()<LBDropDownViewDelegate>

@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *groupModels = @[].mutableCopy;
    for (int i = 0; i < 5; i ++) {
        NSMutableArray *dropDownItemArray = [NSMutableArray array];
        for (int j = 0; j < 4; j++) {
            LBDropDownItem *item = [[LBDropDownItem alloc] init];
            item.content = [NSString stringWithFormat:@"%d",i];
            [dropDownItemArray addObject:item];
        }
        
        LBDropDownGroupNameModel *groupModel = [LBDropDownGroupNameModel modelWithDropDownItems:dropDownItemArray];
        groupModel.content = @"title";
        [groupModels addObject:groupModel];
    }
    LBDropDownModel *model = [LBDropDownModel modelWithLBDropDownGroupNameModel:groupModels];
    LBDropDownView *dropDownView = [LBDropDownView dropDownViewWithModel:model];
    [self.view addSubview:dropDownView];
   
    dropDownView.frame = CGRectMake(10, 74, 80, 100);
    dropDownView.center = self.view.center;
    dropDownView.delegate = self;
    
}

- (void)dropDownView:(LBDropDownView *)dropDownView didSelecteItemSectionIndex:(NSInteger)sectionIndex itemIndex:(NSInteger)itenIndex{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Remind" message:@"u have click item!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    [al show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
