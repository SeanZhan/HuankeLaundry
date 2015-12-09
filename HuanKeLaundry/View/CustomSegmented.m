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
    
    //给_buttonTag属性添加观察者
    [self addObserver: self
           forKeyPath: @"buttonTag"
              options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context: nil];
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
               format: @"use initWithButtonArray,not initWithFrame"];
  return nil;
}

//MARK: - button的点击事件
- (void)buttonClick:(id)sender
{
  self.buttonTag = [sender tag];
  [_delegate didSelect: _buttonTag];
}

//MARK: - 实现当前类属性观察的回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
  NSString *newValueString = [change objectForKey: NSKeyValueChangeNewKey];
  NSString *oldValueString = [change objectForKey: NSKeyValueChangeOldKey];
  
  int newValue = [newValueString intValue];
  int oldValue = [oldValueString intValue];
  

  UIButton *currentButton = [self subviews][newValue] ;
  [currentButton setTitleColor: [UIColor blueForMainStyle]
                      forState: UIControlStateNormal];
  
  [UIView animateWithDuration: 0.1 animations:^{
    _vernierView.frame = CGRectMake(currentButton.frame.origin.x,
                                    currentButton.frame.size.height-5,
                                    currentButton.frame.size.width,
                                    5);
  }];
  
  UIButton *unCheckedButton = [self subviews][oldValue];
  [unCheckedButton setTitleColor: [UIColor blackColor]
                        forState: UIControlStateNormal];
}

//MARK: - 移除观察者
- (void)dealloc
{
 [self removeObserver: self
           forKeyPath: @"buttonTag"];
}


@end
