//
//  ModelViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/28.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "ModelViewController.h"
#import <Masonry/Masonry.h>
#import "CustomCounter.h"

@interface ModelViewController ()

@property (nonatomic) UIControl     *backgroundView;
@property (nonatomic) UIView        *popView;
@property (nonatomic) UIView        *imageBackgroundView;
@property (nonatomic) UIImageView   *clothesImageView;
@property (nonatomic) UILabel       *clothesNameLabel;
@property (nonatomic) UILabel       *priceLabel;
@property (nonatomic) UILabel       *unitLabel;
@property (nonatomic) CustomCounter *ClothesCounter;
@property (nonatomic) UIButton      *putInBasketButton;

@end

@implementation ModelViewController

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
   //设置_backgroundView并且添加约束
  _backgroundView = [[UIControl alloc] init];
  _backgroundView.backgroundColor = [UIColor clearColor];
  [self.view addSubview: _backgroundView];
  [_backgroundView addTarget: self
                      action: @selector(backgroundClick)
            forControlEvents: UIControlEventTouchUpInside];
  [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.trailing.top.bottom.equalTo(self.view);
  }];
  
  //设置_popView并且添加约束
  _popView = [[UIView alloc] init];
  _popView.backgroundColor = [UIColor whiteColor];
  [_backgroundView addSubview: _popView];
  [_popView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(self.view).offset(15);
    make.trailing.equalTo(self.view).offset(-15);
    make.bottom.equalTo(self.view).offset(-15);
    make.height.equalTo(_popView.mas_width);
  }];
  
  //设置_putInBasketButton并且添加约束
  _putInBasketButton = [[UIButton alloc] init];
  [_putInBasketButton setImage: [UIImage imageNamed: @"加入洗衣篮"]
                      forState: UIControlStateNormal];
  [_putInBasketButton setImage: [UIImage imageNamed: @"加入洗衣篮高亮"]
                      forState: UIControlStateHighlighted];
  [_putInBasketButton addTarget: self
                         action: @selector(_putInBasketButtonClick)
               forControlEvents: UIControlEventTouchUpInside];
  [_popView addSubview: _putInBasketButton];
  [_putInBasketButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_popView).offset(4);
    make.trailing.equalTo(_popView).offset(-4);
    make.bottom.equalTo(_popView).offset(-5);
    make.height.equalTo(_putInBasketButton.mas_width).multipliedBy(0.15);
  }];
  
  //设置_ClothesCounter并且添加约束
  _ClothesCounter = [[CustomCounter alloc]initWithFrame:CGRectZero];
  [_popView addSubview: _ClothesCounter];
  [_ClothesCounter mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.bottom.equalTo(_putInBasketButton.mas_top).offset(-20);
    make.centerX.equalTo(self.view);
    make.width.equalTo(_popView).multipliedBy(0.6);
    make.height.equalTo(_ClothesCounter.mas_width).multipliedBy(0.25);

  }];

  //设置_imageBackgroundView并且添加约束
  _imageBackgroundView = [[UIView alloc] init];
  _imageBackgroundView.backgroundColor = [UIColor redColor];
  [_popView addSubview: _imageBackgroundView];
  [_imageBackgroundView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_popView).offset(15);
    make.top.equalTo(_popView).offset(20);
    make.bottom.equalTo(_ClothesCounter.mas_top).offset(-30);
    make.width.equalTo(_imageBackgroundView.mas_height).multipliedBy(0.9);
  }];
  
  //设置_clothesImageView并且添加约束
  _clothesImageView = [[UIImageView alloc] init];
  _clothesImageView.backgroundColor = [UIColor whiteColor];  //------>>>>>临时
  [_imageBackgroundView addSubview: _clothesImageView];
  [_clothesImageView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_imageBackgroundView).offset(10);
    make.trailing.equalTo(_imageBackgroundView).offset(-10);
    make.top.equalTo(_imageBackgroundView).offset(10);
    make.bottom.equalTo(_imageBackgroundView).offset(-10);
  }];
  
  //设置_clothesNameLabel并且添加约束
  _clothesNameLabel = [[UILabel alloc] init];
  _clothesNameLabel.font = fontAsHeitiSC19;
  _clothesNameLabel.text = @"皮大衣";      // ----->>>>>>>>>临时
  [_clothesNameLabel sizeToFit];
  [_popView addSubview: _clothesNameLabel];
  [_clothesNameLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_imageBackgroundView.mas_trailing).offset(15);
    make.top.equalTo(_imageBackgroundView);
  }];
  
  //设置_priceLabel并且添加约束
  _priceLabel = [[UILabel alloc] init];
  _priceLabel.textColor = [UIColor orangeColorForPrice];
  _priceLabel.font = fontAsMicrosoftYaHei22;
  _priceLabel.text = @"111111111";  //---------->>>>>>>>临时
  [_priceLabel sizeToFit];
  [_popView addSubview: _priceLabel];
  [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_imageBackgroundView.mas_trailing).offset(10);
    make.top.equalTo(_clothesNameLabel.mas_bottom).offset(10);
  }];
  
  //设置_unitLabel并且添加约束
  _unitLabel = [[UILabel alloc] init];
  _unitLabel.font = fontAsHeitiSC17;
  _unitLabel.text = @"/袋";  // --------->>>>>>>>>临时
  [_unitLabel sizeToFit];
  [_popView addSubview: _unitLabel];
  [_unitLabel mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_priceLabel.mas_trailing);
    make.bottom.equalTo(_priceLabel);
  }];
}

//MARK: _backgroundView的点击事件
- (void)backgroundClick
{
  [self dismissViewControllerAnimated: true
                           completion: nil];
}

//MARK: - _putInBasketButton的点击事件
- (void)_putInBasketButtonClick
{
  [self dismissViewControllerAnimated: true
                           completion: nil];
}

//MARK:
- (void)didReduceClothesNumber
{
  
}

- (void)didAddClothesNumber
{
  
}

@end

