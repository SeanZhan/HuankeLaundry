//
//  MyViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/27.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "MyViewController.h"
#import "MyViewCustomButton.h"
#import <Masonry/Masonry.h>

@interface MyViewController ()

@property (nonatomic) UIView             *userInfoView;
@property (nonatomic) UIImageView        *iconImageView;
@property (nonatomic) UIImageView        *poneNumberImageView;
@property (nonatomic) UILabel            *userNameLabel;
@property (nonatomic) UILabel            *poneNumberLabel;
@property (nonatomic) UILabel            *referralLabel;
@property (nonatomic) UILabel            *referralCodeLabel;
@property (nonatomic) UILabel            *couponLabel;
@property (nonatomic) UIView             *horizontalLine;
@property (nonatomic) UIView             *verticalLine;
@property (nonatomic) MyViewCustomButton *myOrderButton;
@property (nonatomic) MyViewCustomButton *myMoneyButton;
@property (nonatomic) MyViewCustomButton *myAddress;
@property (nonatomic) MyViewCustomButton *shareReferralCodeButton;
@property (nonatomic) MyViewCustomButton *checkReferralCodeButton;

@end

@implementation MyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

//MARK: - 设置UI
- (void)setUI
{
  //定义_userInfoView并进行约束
  _userInfoView = [[UIView alloc] init];
  _userInfoView.backgroundColor = [UIColor blueForMainStyle];
  [self.view addSubview: _userInfoView];
  [_userInfoView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.leading.trailing.equalTo(self.view);
    make.height.equalTo(self.view).multipliedBy(0.37);
  }];
  
  //定义_horizontalLine并进行约束
  _horizontalLine = [[UIView alloc] init];
  _horizontalLine.backgroundColor = [UIColor whiteColor];
  [_userInfoView addSubview:_horizontalLine];
  [_horizontalLine mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.leading.equalTo(_userInfoView).offset(20);
     make.trailing.equalTo(_userInfoView).offset(-20);
     make.height.equalTo(@1);
     make.bottom.equalTo(_userInfoView).offset(-55);
   }];
  
  //定义_verticalLine并进行约束
  _verticalLine = [[UIView alloc] init];
  _verticalLine.backgroundColor = [UIColor whiteColor];
  [_userInfoView addSubview: _verticalLine];
  [_verticalLine mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.centerX.equalTo(self.view);
     make.width.equalTo(@1);
     make.top.equalTo(_horizontalLine.mas_bottom).offset(10);
     make.bottom.equalTo(_userInfoView).offset(-10);
   }];
  
  //定义_referralLabel并进行约束
  _referralLabel = [[UILabel alloc] init];
  _referralLabel.font = fontAsHeitiSC19;
  _referralLabel.text = @"推荐码:";
  _referralLabel.textAlignment = NSTextAlignmentCenter;
  _referralLabel.textColor = [UIColor whiteColor];
  [_userInfoView addSubview: _referralLabel];
  [_referralLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.bottom.equalTo(_userInfoView);
    make.top.equalTo(_horizontalLine.mas_bottom);
  }];
  
  //定义_referralCodeLabel并进行约束
  _referralCodeLabel = [[UILabel alloc] init];
  _referralCodeLabel.font = fontAsHZGB19;
  _referralCodeLabel.text = @"S19J6Q";   //------>>>>>>临时
  _referralCodeLabel.textAlignment = NSTextAlignmentCenter;
  _referralCodeLabel.textColor = [UIColor whiteColor];
  [_userInfoView addSubview: _referralCodeLabel];
  [_referralCodeLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_referralLabel.mas_trailing);
    make.top.equalTo(_horizontalLine.mas_bottom);
    make.trailing.equalTo(_verticalLine.mas_leading);
    make.bottom.equalTo(_userInfoView);
    make.width.equalTo(_referralLabel);
    
  }];
  
  //
  _couponLabel = [[UILabel alloc] init];
  _couponLabel.font = fontAsHeitiSC19;
  _couponLabel.text = @"余2张洗衣券"; //---------->>>>>>>临时
  _couponLabel.textAlignment = NSTextAlignmentCenter;
  _couponLabel.textColor = [UIColor whiteColor];
  [_userInfoView addSubview: _couponLabel];
  [_couponLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.equalTo(_horizontalLine.mas_bottom);
    make.bottom.equalTo(_userInfoView);
    make.leading.equalTo(_verticalLine.mas_trailing);
    make.trailing.equalTo(self.view);
  }];
  
  
  //定义_iconImageView并进行约束
  _iconImageView = [[UIImageView alloc] init];
  _iconImageView.image = [UIImage imageNamed: @"8-0"];
  [_userInfoView addSubview: _iconImageView];
  [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(self.view).offset(30);
    make.width.equalTo(@18);
    make.height.equalTo(@24);
  }];
  
  //定义_userNameLabel并进行约束
  _userNameLabel = [[UILabel alloc] init];
  _userNameLabel.font = fontAsHeitiSC19;
  _userNameLabel.text = @"李小姐";  // ------------------->>>>>>>临时
  _userNameLabel.textColor = [UIColor whiteColor];
  [_userNameLabel sizeToFit];
  [_userInfoView addSubview: _userNameLabel];
  [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_iconImageView.mas_trailing).offset(5);
    make.bottom.equalTo(_iconImageView);
  }];
  
  //定义_poneNumberImageView并进行约束
  _poneNumberImageView = [[UIImageView alloc]init];
  _poneNumberImageView.image = [UIImage imageNamed: @"9-0"];
  [_userInfoView addSubview: _poneNumberImageView];
  [_poneNumberImageView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.width.height.equalTo(_iconImageView);
    make.top.equalTo(_iconImageView.mas_bottom).offset(18);
    make.bottom.equalTo(_horizontalLine.mas_top).offset(-25);
  }];
  
  //定义_poneNumberLabel并进行约束
  _poneNumberLabel = [[UILabel alloc] init];
  _poneNumberLabel.font = fontAsMicrosoftYaHei19;
  _poneNumberLabel.text = @"15168685466"; // ------------>>>>>>临时
  _poneNumberLabel.textColor = [UIColor whiteColor];
  [_poneNumberLabel sizeToFit];
  [_userInfoView addSubview: _poneNumberLabel];
  [_poneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_poneNumberImageView.mas_trailing).offset(5);
    make.bottom.equalTo(_poneNumberImageView);
  }];
  
  //定义_myOrderButton并进行约束
  _myOrderButton = [[MyViewCustomButton alloc] initWithName: @"我的订单"
                                            iconImageString: @"1-1"];
  [self.view addSubview: _myOrderButton];
  [_myOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_userInfoView.mas_bottom).offset(30);
    make.leading.equalTo(self.view).offset(20);
    make.height.equalTo(_myOrderButton.mas_width).multipliedBy(1.43);
  }];
  
  //定义_myMoneyButton并进行约束
  _myMoneyButton = [[MyViewCustomButton alloc] initWithName: @"我的金币"
                                            iconImageString: @"2-1"];
  [self.view addSubview: _myMoneyButton];
  [_myMoneyButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_myOrderButton.mas_trailing).offset(35);
    make.top.height.width.equalTo(_myOrderButton);
  }];
  
  //定义_myAddress并进行约束
  _myAddress = [[MyViewCustomButton alloc] initWithName: @"我的地址"
                                        iconImageString: @"3-1"];
  [self.view addSubview: _myAddress];
  [_myAddress mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_myMoneyButton.mas_trailing).offset(35);
    make.top.width.height.equalTo(_myOrderButton);
    make.trailing.equalTo(self.view).offset(-20);
  }];
  
  //定义_shareReferralCodeButton并进行约束
  _shareReferralCodeButton = [[MyViewCustomButton alloc] initWithName: @"分享推荐码"
                                                      iconImageString: @"3-1"];
  [self.view addSubview: _shareReferralCodeButton];
  [_shareReferralCodeButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_myOrderButton);
    make.width.height.equalTo(_myOrderButton);
    make.bottom.equalTo(self.view).offset(-69);
  }];
  
  //定义_checkReferralCodeButton并进行约束
  _checkReferralCodeButton = [[MyViewCustomButton alloc] initWithName: @"验证推荐码"
                                                      iconImageString: @"4-1"];
  [self.view addSubview: _checkReferralCodeButton];
  [_checkReferralCodeButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_myMoneyButton);
    make.width.height.equalTo(_myOrderButton);
    make.bottom.equalTo(self.view).offset(-69);
  }];
}

@end
