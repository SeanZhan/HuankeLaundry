//
//  MoreViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/27.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "MoreViewController.h"
#import <Masonry/Masonry.h>
#import "MoreTableViewCell.h"

@interface MoreViewController ()
{
  NSArray *_iconImageArray;
  NSArray *_hintTextArray;
}

@property (nonatomic) UIView      *navigationBar;
@property (nonatomic) UILabel     *navigationTitle;
@property (nonatomic) UITableView *tableView;

@end

@implementation MoreViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setUI];              //调用函数设置UI
  
  _tableView.delegate = self;
  _tableView.dataSource = self;
  
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;   //设置tableView无分割线
  
  [_tableView registerClass: [MoreTableViewCell self]  //注册cell
     forCellReuseIdentifier: @"MoreTabelViewCell"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

//MARK: - 设置UI
- (void)setUI
{
  self.view.backgroundColor = [UIColor grayColorForBackground];
  //设置_navigationBar约束及其属性
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor whiteColor];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.trailing.leading.top.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  //设置_navigationTitle约束及其属性
  _navigationTitle = [[UILabel alloc] init];
  _navigationTitle.text = @"更多";
  _navigationTitle.font = fontAsHeitiSC19;
  [_navigationBar addSubview: _navigationTitle];
  [_navigationTitle sizeToFit];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
  }];
  
  //设置_tableView约束及其属性
  _tableView = [[UITableView alloc] init];
  _tableView.backgroundColor = [UIColor grayColorForBackground];
  [self.view addSubview: _tableView];
  [_tableView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.trailing.leading.bottom.equalTo(self.view);
    make.top.equalTo(_navigationBar.mas_bottom).offset(1);
  }];
  
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  _iconImageArray = MoreCellIconImageArray;
  _hintTextArray = MoreCellHintTextArray;
  return _iconImageArray.count;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier: @"MoreTabelViewCell"];
  MoreTableViewCell *customCell = (MoreTableViewCell *)cell;
  [customCell setIconImage: _iconImageArray[indexPath.row]];
  [customCell setHintLableText: _hintTextArray[indexPath.row]];
  return customCell;
}

//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 50;
}



@end

