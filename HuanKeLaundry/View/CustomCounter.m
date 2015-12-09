//
//  CustomCounter.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/30.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "CustomCounter.h"

@implementation CustomCounter

//重写init
- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    //设置_reduceButton并且添加约束
    _reduceButton = [[UIButton alloc] init];
    [_reduceButton setBackgroundImage: [UIImage imageNamed: @"减小按钮"]
                             forState: UIControlStateNormal];
    [_reduceButton setBackgroundImage: [UIImage imageNamed: @"减小按钮高亮"]
                             forState: UIControlStateHighlighted];
    [_reduceButton addTarget: self
                      action: @selector(reduceButtonClick)
            forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: _reduceButton];
    [_reduceButton mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.leading.top.bottom.equalTo(self);
      make.width.equalTo(self).multipliedBy(0.285);
    }];
    
    //设置_numberLaber并且添加约束
    _numberLaber = [[UILabel alloc] init];
    _numberLaber.font = fontAsHeitiSC15;
    _numberLaber.text = [NSString stringWithFormat: @"%d",_cloteseNumber];
    _numberLaber.textColor = [UIColor orangeColorForPrice];
    _numberLaber.textAlignment = NSTextAlignmentCenter;
    _numberLaber.layer.borderWidth = 1.0;
    _numberLaber.layer.borderColor = [[UIColor grayColorForBorder] CGColor];
    [self addSubview: _numberLaber];
    [_numberLaber mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.centerX.equalTo(self);
      make.top.bottom.equalTo(self);
      make.width.equalTo(self).multipliedBy(0.43);
    }];
    
    //设置_addButton并且添加约束
    _addButton = [[UIButton alloc] init];
    [_addButton setBackgroundImage: [UIImage imageNamed: @"增加按钮"]
                          forState: UIControlStateNormal];
    [_addButton setBackgroundImage: [UIImage imageNamed: @"增加按钮高亮"]
                          forState: UIControlStateHighlighted];
    [_addButton addTarget: self
                   action: @selector(addButtonClick)
         forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: _addButton];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make)
    {
      make.top.bottom.trailing.equalTo(self);
      make.width.equalTo(self).multipliedBy(0.285);
    }];
  }
  
  return self;
}

//禁用init
-(instancetype)init
{
  [NSException  raise: @"CustomCounterInitialization"
               format: @"use initWithFrame,not init"];
  return nil;
}

//MARK: “+”，“-”按钮的点击事件
 - (void)reduceButtonClick
{
  if (_cloteseNumber > 0) {
    --_cloteseNumber;
    _numberLaber.text = [NSString stringWithFormat: @"%d",_cloteseNumber];
  }
  else {
    _cloteseNumber = 0;
  }
}

- (void)addButtonClick
{
  ++_cloteseNumber;
  _numberLaber.text = [NSString stringWithFormat: @"%d",_cloteseNumber];
}

@end
