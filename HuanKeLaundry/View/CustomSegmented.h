//
//  CusomSegmented.h
//  HuanKeLaundry
//
//  Created by zhan on 15/12/3.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegmentedDelegate <NSObject>

- (void)didSelect:(int)tag;

@end


@interface CustomSegmented : UIView

@property (nonatomic) int buttonTag;

@property (nonatomic) UIView *vernierView;

@property (nonatomic) id<CustomSegmentedDelegate> delegate;

-(instancetype)initWithButtonArray:(NSArray *)ButtonArray
                             frame:(CGRect)frame;

@end
