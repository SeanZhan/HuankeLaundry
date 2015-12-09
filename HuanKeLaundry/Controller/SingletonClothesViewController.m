//
//  SingletonClothesViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/12/3.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "SingletonClothesViewController.h"
#import "CustomSegmented.h"
#import <Masonry/Masonry.h>

@interface SingletonClothesViewController ()

@property (nonatomic) NSInteger      *buttonTag;
@property (nonatomic) UIView         *navigationBar;
@property (nonatomic) UIButton       *backButton;
@property (nonatomic) UILabel        *navigationTitle;
@property (nonatomic) CustomSegmented *clothesSegmented;

@end

@implementation SingletonClothesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setUI];
  
  _clothesSegmented.delegate = self;

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

//MARK: 设置UI
- (void)setUI
{
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor whiteColor];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.trailing.top.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  _backButton = [[UIButton alloc] init];
  [_backButton setImage: [UIImage imageNamed: @"返回"]
               forState: UIControlStateNormal];
  [_backButton setImage: [UIImage imageNamed: @"返回高亮"]
               forState: UIControlStateHighlighted];
  [_backButton addTarget: self
                  action: @selector(backButtonClick)
        forControlEvents: UIControlEventTouchUpInside];
  [_navigationBar addSubview: _backButton];
  [_backButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.bottom.equalTo(_navigationBar);
    make.width.height.equalTo(@44);
  }];
  
  _navigationTitle = [[UILabel alloc] init];
  _navigationTitle.text = @"件洗";
  _navigationTitle.font = fontAsHeitiSC19;
  [_navigationTitle sizeToFit];
  [_navigationBar addSubview: _navigationTitle];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
  }];
  
  _clothesSegmented = [[CustomSegmented alloc] initWithButtonArray:ButtonNameArray frame:CGRectMake(0, 64, screenWidth, 44)];
  [self.view addSubview: _clothesSegmented];
}

//_backButton的点击事件
- (void)backButtonClick
{
  [self.navigationController popViewControllerAnimated: true];
}

//MARK: CustomSegmentedDelegate,将选中的button的tag回传
- (void)didSelect:(NSInteger)tag
{
  NSLog(@"%ld",(long)tag);
}

@end
