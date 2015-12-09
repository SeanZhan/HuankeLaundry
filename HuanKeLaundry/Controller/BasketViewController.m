//
//  BasketViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/27.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "BasketViewController.h"
#import <Masonry/Masonry.h>
#import "CustomSegmented.h"

@interface BasketViewController ()

@property (nonatomic) UIView  *navigationBar;
@property (nonatomic) UILabel *navigationTitle;

@end

@implementation BasketViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setUI
{
  self.view.backgroundColor = [UIColor grayColorForBackground];
  //设置_navigationBar并添加约束
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor whiteColor];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.leading.trailing.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  //设置_navigationTitle并添加约束
  _navigationTitle = [[UILabel alloc] init];
  _navigationTitle.text = @"洗衣篮";
  _navigationTitle.font = fontAsHeitiSC19;
  [_navigationTitle sizeToFit];
  [_navigationBar addSubview: _navigationTitle];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
  }];
}

@end
