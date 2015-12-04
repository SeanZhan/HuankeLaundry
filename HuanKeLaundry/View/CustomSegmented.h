//
//  CusomSegmented.h
//  HuanKeLaundry
//
//  Created by zhan on 15/12/3.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegmentedDelegate <NSObject>

- (NSInteger)

@end

@interface CustomSegmented : UIView

@property (nonatomic) NSInteger *buttonTag;

@property (nonatomic) UIView *vernierView;

-(instancetype)initWithButtonArray:(NSArray *)ButtonArray
                             frame:(CGRect)frame;

@end
