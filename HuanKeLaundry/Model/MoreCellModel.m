//
//  MoreCellFunction.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/29.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "MoreCellModel.h"

@implementation MoreCellModel

//指定初始化方法
- (instancetype)initWithIconImageName:(NSString *)iconImageName
                         hintLabelTex:(NSString *)hintLabelText
{
  self = [super init];
  
  if (self) {
    _iconImageName = iconImageName;
    _hintLabelText = hintLabelText;
  }
  
  return self;
}

- (instancetype)init
{
  return [self initWithIconImageName:nil
                        hintLabelTex:nil];
}

@end
