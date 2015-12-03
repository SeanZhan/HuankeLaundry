//
//  UIColor+Extension.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)orangeColorForPrice;    // #ff4d0f橙色,用于显示价格的
+ (UIColor *)blueForMainStyle;       // #28ccfc蓝色
+ (UIColor *)grayColorForBackground; // #f4f4f4，用于显示背景灰色
+ (UIColor *)grayColorForBorder;     // #dddddd,用于显示边框线条
+ (UIColor *)grayColorForIcon;       // #bcbdc3,用于显示图标

@end
