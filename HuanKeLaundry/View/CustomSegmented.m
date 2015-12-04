//
//  CusomSegmented.m
//  HuanKeLaundry
//
//  Created by zhan on 15/12/3.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "CustomSegmented.h"

@implementation CustomSegmented

//MARK: - 指定初始化方法
-(instancetype)initWithButtonArray:(NSArray *)ButtonArray
                             frame:(CGRect)frame
{
  self = [super initWithFrame: frame];
  
  if (self) {
    //循环添加button
    for (int i = 0; i < ButtonArray.count; ++i) {
      UIButton *button = [[UIButton alloc] init];
      
      button.frame = CGRectMake((frame.size.width/ButtonArray.count)*i,
                                0,
                                frame.size.width/ButtonArray.count,
                                frame.size.height);
      button.tag = i;
      
      [button addTarget: self
                 action: @selector(buttonClick:)
       forControlEvents: UIControlEventTouchUpInside];
      
      [button setTitle: ButtonArray[i]
              forState: UIControlStateNormal];
      [button setTitleColor: [UIColor blackColor]
                   forState: UIControlStateNormal];
      button.titleLabel.font = fontAsHeitiSC19;
      
      button.backgroundColor = [UIColor whiteColor];
      button.layer.borderColor = [[UIColor grayColorForBorder] CGColor];
      button.layer.borderWidth = 1.0;
      
      [self addSubview: button];
      
    }
    
    //设置_vernierView并且添加约束
    _vernierView = [[UIView alloc] init];
    _vernierView.frame = CGRectMake(0,
                                    frame.size.height - 5,
                                    frame.size.width / ButtonArray.count,
                                    5);
    _vernierView.backgroundColor = [UIColor blueForMainStyle];
    [self addSubview: _vernierView];
    
    //初始化_buttonTag
    _buttonTag = 0;
    
  }
  
  return self;
}

//禁用init方法
- (instancetype)init
{
  [NSException  raise: @"CustomCounterInitialization"
               format: @"use initWithButtonArray,not init"];
  return nil;
}
//禁用initWithFrame
- (instancetype)initWithFrame:(CGRect)frame
{
  [NSException  raise: @"CustomCounterInitialization"
               format: @"use initWithButtonArray,not init"];
  return nil;
}

//MARK: - button的点击事件
- (void)buttonClick:(id)sender
{
  _buttonTag = [sender tag];
}

@end
