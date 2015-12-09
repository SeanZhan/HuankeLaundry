//
//  MoreTableViewCell.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/28.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "MoreTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation MoreTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
}


//MARK: - 重写Cell的init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle: style
              reuseIdentifier:reuseIdentifier];
  
  if (self) {
    [self setUI];
  }
  
  self.selectionStyle = UITableViewCellSelectionStyleNone;  //设置cell被选中是不变色
  
  return self;
}

//MARK: - 设置cell的UI
- (void)setUI
{
  //设置_iconImageView的属性和约束
  _iconImageView = [[UIImageView alloc] init];
  [self addSubview: _iconImageView];
  [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.top.equalTo(self).offset(15);
     make.leading.equalTo(self).offset(15);
     make.bottom.equalTo(self).offset(-15);
     make.width.equalTo(_iconImageView.mas_height);
   }];
  
  //设置_hintLable的属性和约束
  _hintLable = [[UILabel alloc] init];
  _hintLable.font = fontAsHeitiSC15;
  [_hintLable sizeToFit];
  [self addSubview: _hintLable];
  [_hintLable mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.top.bottom.equalTo(_iconImageView);
     make.leading.equalTo(_iconImageView.mas_trailing).offset(10);
   }];
  
  //设置_detailImageView的属性的约束
  _detailImageView = [[UIImageView alloc] init];
  _detailImageView.image = [UIImage imageNamed: @"11-1"];
  [self addSubview: _detailImageView];
  [_detailImageView mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.top.equalTo(self).offset(20);
     make.trailing.equalTo(self).offset(-20);
     make.bottom.equalTo(self).offset(-20);
     make.width.equalTo(_detailImageView.mas_height).multipliedBy(0.583);
   }];
  
  //设置_separateLine的属性和约束
  _separateLine = [[UIView alloc] init];
  _separateLine.backgroundColor = [UIColor grayColorForBorder];
  [self addSubview: _separateLine];
  [_separateLine mas_makeConstraints:^(MASConstraintMaker *make)
   {
     make.bottom.trailing.equalTo(self);
     make.height.equalTo(@1);
     make.width.equalTo(self).multipliedBy(0.9);
   }];
}

//MARK: - 设置iconImageView的image和hintLabel的text的方法
- (void)setIconImage:(NSString *)iconImageString
{
  _iconImageView.image = [UIImage imageNamed: iconImageString];
}

- (void)setHintLableText:(NSString *)hintLableText
{
  _hintLable.text = hintLableText;
}

@end
