# LBDropDownView

##  辛辛苦苦点进来。 ～ 那就给个星星吧～

## Author

Leon-Lee

## Usage
```
//这套代码做的事多个section ，每个section里面有又有多个item，类似UITableView，通过model即可配置UI 和数据，如需修改UI,LBDropDownItemView.m 里面可以修改。
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
[self.view layoutIfNeeded];
LBDropDownView *dropDownView = [LBDropDownView dropDownViewWithModel:model];
[self.view addSubview:dropDownView];
//    [dropDownView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(v);
//        make.top.equalTo(v.mas_bottom).with.offset(10);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(100);
//    }];
dropDownView.frame = CGRectMake(10, 74, 200, 100);
dropDownView.delegate = self;
```



