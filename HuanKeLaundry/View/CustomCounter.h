//
//  CustomCounter.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/30.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

//CustomCounter代理的协议
@protocol CustomCounterDelegate <NSObject>

- (void)didAddClothesNumber;

- (void)didReduceClothesNumber;

@end


@interface CustomCounter : UIView
{
  int _cloteseNumber;
}

@property (nonatomic) id<CustomCounterDelegate> delegate;

@property (nonatomic) UIButton *reduceButton;
@property (nonatomic) UIButton *addButton;
@property (nonatomic) UILabel  *numberLaber;

@end
