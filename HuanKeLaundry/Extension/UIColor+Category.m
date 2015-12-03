//
//  UIColor+Extension.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)orangeColorForPrice
{
  return [[UIColor alloc] initWithRed: 255.0/255.0
                                green: 77.0/255.0
                                 blue: 15.0/255.0
                                alpha: 1.0];
}

+ (UIColor *)blueForMainStyle
{
  return [[UIColor alloc] initWithRed: 40.0/255.0
                                green: 204.0/255.0
                                 blue: 252.0/255.0
                                alpha: 1.0];
}

+ (UIColor *)grayColorForBackground
{
  return [[UIColor alloc] initWithRed: 244.0/255.0
                                green: 244.0/255.0
                                 blue: 244.0/255.0
                                alpha: 1.0];
}

+ (UIColor *)grayColorForBorder
{
  return [[UIColor alloc] initWithRed: 221.0/255.0
                                green: 221.0/255.0
                                 blue: 221.0/255.0
                                alpha: 1.0];
}

+ (UIColor *)grayColorForIcon
{
  return [[UIColor alloc] initWithRed: 188.0/255.0
                                green: 189.0/255.0
                                 blue: 195.0/255.0
                                alpha: 1.0];
}

@end
