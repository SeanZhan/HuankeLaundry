//
//  MoreTableViewCell.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/28.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableViewCell : UITableViewCell

@property (nonatomic) UIImageView   *iconImageView;
@property (nonatomic) UILabel       *hintLable;
@property (nonatomic) UIImageView   *detailImageView;
@property (nonatomic) UIView        *separateLine;

// 设置iconImageView的image和hintLabel的text的方法
- (void)setIconImage:(NSString *)iconImageString;
- (void)setHintLableText:(NSString *)hintLableText;


@end
