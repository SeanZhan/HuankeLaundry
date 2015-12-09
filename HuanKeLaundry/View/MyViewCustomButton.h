//
//  MyViewCustomButton.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/29.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewCustomButton : UIControl

@property (nonatomic) UIImageView *iconImageView;
@property (nonatomic) UILabel     *nameLabel;

// 指定初始化方法
- (instancetype)initWithName:(NSString *)name
             iconImageString:(NSString *)ImageString;

@end
