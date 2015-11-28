//
//  LoginViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#import "Networke.h"

@interface LoginViewController ()

@property (nonatomic) UIView *navigationBar;
@property (nonatomic) UILabel *navigationTitle;
@property (nonatomic) UITextField *poneNumberTextField;
@property (nonatomic) UITextField *captchaTextField;
@property (nonatomic) UIButton *getCaptchaButton;
@property (nonatomic) UIButton *loginButton;
@property (nonatomic) UILabel *hintLabel;
@property (nonatomic) UIButton *userAgreementButton;
@property (nonatomic) UITapGestureRecognizer *tapGestuer;

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
  self.view.backgroundColor = [UIColor grayColor];
  //设置_navigationBar的各项属性和约束
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor whiteColor];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.leading.trailing.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  //设置_navigationTitle的各项属性和约束
  _navigationTitle = [[UILabel alloc] init];
  _navigationTitle.text = @"绑定手机登录";
  _navigationTitle.font = fontAsHeitiSC19;
  [_navigationTitle sizeToFit];
  [_navigationBar addSubview:_navigationTitle];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
  }];
  
  //设置_getCaptchaButton的各项属性和约束
  _getCaptchaButton = [[UIButton alloc] init];
  _getCaptchaButton.backgroundColor = [UIColor redColor];
  [_getCaptchaButton setTitle: @"获取验证码" forState: 0];
  [_getCaptchaButton titleLabel].font = fontAsHeitiSC19;
  [self.view addSubview: _getCaptchaButton];
  [_getCaptchaButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_navigationBar.mas_bottom).offset(20);
    make.trailing.equalTo(_navigationBar).offset(-15);
    make.width.equalTo(@110);
    make.height.equalTo(@50);
  }];
  
  //设置_poneNumberTextField的各项属性和约束
  _poneNumberTextField = [[UITextField alloc] init];
  _poneNumberTextField.backgroundColor = [UIColor whiteColor];
//  _poneNumberTextField.layer.borderColor = [];
//  _poneNumberTextField.layer.borderWidth = 1.0;
  _poneNumberTextField.placeholder = @"  请输入手机号码";
  [self.view addSubview: _poneNumberTextField];
  [_poneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_navigationBar.mas_bottom).offset(20);
    make.leading.equalTo(self.view).offset(15);
    make.trailing.equalTo(_getCaptchaButton.mas_leading).offset(-10);
    make.height.equalTo(_getCaptchaButton.mas_height);
  }];
  
  //设置_captchaTextField的各项属性和约束
  _captchaTextField = [[UITextField alloc] init];
  _captchaTextField.backgroundColor = [UIColor whiteColor];
  _captchaTextField.placeholder = @"  请输入验证码";
  [self.view addSubview: _captchaTextField];
  [_captchaTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(_poneNumberTextField);
    make.trailing.equalTo(_getCaptchaButton);
    make.height.equalTo(_getCaptchaButton);
    make.top.equalTo(_getCaptchaButton.mas_bottom).offset(15);
  }];
  
  //设置_loginButton的各项属性和约束
  _loginButton = [[UIButton alloc] init];
  _loginButton.backgroundColor = [UIColor blueForMainStyle];
  [_loginButton setTitle:@"绑定手机登录" forState:0];
  [_loginButton titleLabel].font = fontAsHeitiSC19;
  [_loginButton addTarget: self
                   action: @selector(loginButtonClick)
         forControlEvents: 1 <<  6];
  [self.view addSubview: _loginButton];
  [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.height.trailing.equalTo(_captchaTextField);
    make.top.equalTo(_captchaTextField.mas_bottom).offset(20);
  }];
  
  //设置_hintLabel的各项属性和约束
  _hintLabel = [[UILabel alloc] init];
  _hintLabel.text = @"点击“绑定手机登录”即表示同意";
  _hintLabel.font = fontAsHeitiSC12;
  _hintLabel.tintColor = [UIColor blackColor];
  [_hintLabel sizeToFit];
  [self.view addSubview: _hintLabel];
  [_hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(_loginButton);
    make.top.equalTo(_loginButton.mas_bottom).offset(10);
  }];
  
  //设置_userAgreementButton的各项属性和约束
  _userAgreementButton = [[UIButton alloc] init];
  [_userAgreementButton setTitle: @"《快洗用户协议》" forState: 0];
  [_userAgreementButton titleLabel].font = fontAsHeitiSC12;
  [_userAgreementButton setTitleColor: [UIColor blueForMainStyle] forState:0];
  [_userAgreementButton sizeToFit];
  [self.view addSubview: _userAgreementButton];
  [_userAgreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.equalTo(_hintLabel.mas_trailing);
    make.top.height.equalTo(_hintLabel);
  }];
  
  //设置_tapGestuer
  _tapGestuer = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(backgroundTap)];
  [self.view addGestureRecognizer: _tapGestuer];
}

//MARK: - _tapGestuer实现事件
-  (void)backgroundTap
{
  [_poneNumberTextField resignFirstResponder];
  [_captchaTextField resignFirstResponder];
}

//MARK: - _loginButton点击事件
- (void)loginButtonClick
{
  [[Networke shardeNetwork] getID];
}

@end
