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
  return [[UIColor alloc] initWithRed: 255/255
                                green: 77/255
                                 blue: 15/255
                                alpha: 1.0];
}

+ (UIColor *)blueForMainStyle
{
  return [[UIColor alloc] initWithRed: 40/255
                                green: 204/255
                                 blue: 252/255
                                alpha: 1.0];
}

+ (UIColor *)grayColorForBackground
{
  return [[UIColor alloc] initWithRed: 244/255
                                green: 244/255
                                 blue: 244/255
                                alpha: 1.0];
}

+ (UIColor *)grayColorForBorder
{
  return [[UIColor alloc] initWithRed: 221/255
                                green: 221/255
                                 blue: 221/255
                                alpha: 1.0];
}

+ (UIColor *)grayColorForIcon
{
  return [[UIColor alloc] initWithRed: 188/255
                                green: 189/255
                                 blue: 195/255
                                alpha: 1.0];
}

@end
