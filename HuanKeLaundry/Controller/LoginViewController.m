//
//  LoginViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>

@interface LoginViewController ()

@property (nonatomic) UIView *navigationBar;
@property (nonatomic) UILabel *navigationTitle;
@property (nonatomic) UITextField *poneNumberTextField;
@property (nonatomic) UITextField *captchaTextField;
@property (nonatomic) UIButton *getCaptchaButton;
@property (nonatomic) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}

//MARK: - 设置UI
- (void)setUI
{
  self.view.backgroundColor = [UIColor orangeColorForPrice];
  //设置_navigationBar的各项属性和约束
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor orangeColorForPrice];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.leading.trailing.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  //设置_navigationBarTitle的各项属性和约束
  _navigationTitle = [[UILabel alloc] init];
  _navigationTitle.text = @"绑定手机登录";
  _navigationTitle.font = fontForHeitiSC17;
  [_navigationTitle sizeToFit];
  [_navigationBar addSubview:_navigationTitle];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
  }];
  
  
  
}

@end
