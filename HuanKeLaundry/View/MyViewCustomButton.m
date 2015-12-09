//
//  MyViewCustomButton.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/29.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "MyViewCustomButton.h"
#import <Masonry/Masonry.h>

@implementation MyViewCustomButton

- (instancetype)initWithName:(NSString *)name
             iconImageString:(NSString *)ImageString
{
  self = [super init];
  if (self) {
    
    //定义_iconImageView并进行约束
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed: ImageString];
    [self addSubview: _iconImageView];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.leading.top.trailing.equalTo(self);
      make.height.equalTo(_iconImageView.mas_width);
    }];
    
    //定义_nameLabel并进行约束
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = fontAsHeitiSC15;
    _nameLabel.text = name;
    [_nameLabel sizeToFit];
    [self addSubview: _nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.centerX.equalTo(self);
      make.top.equalTo(_iconImageView.mas_bottom).offset(10);
    }];
  }

  return self;
}

@end
