//
//  UIColor+Extension.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/25.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

//返回#ff4d0f橙色用于标记价格
+ (UIColor *)orangeColorForPrice;

//返回#28ccfc蓝色
+ (UIColor *)mainBlueColor;

//返回#f4f4f4用于背景色
+ (UIColor *)grayColorForBackground;

//返回#dddddd用于边框线条
+ (UIColor *)grayColorForBorder;

@end
