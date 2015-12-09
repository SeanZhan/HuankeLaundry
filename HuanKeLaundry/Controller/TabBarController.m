//
//  TabBarController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/27.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "TabBarController.h"
#import "HomePageViewController.h"
#import "BasketViewController.h"
#import "MyViewController.h"
#import "MoreViewController.h"

@interface TabBarController ()

@property (nonatomic) UIView *separateLine;

@end

@implementation TabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addItemsToSelf];
  [self setTabBarUI];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setTabBarUI
{
  self.tabBar.backgroundColor = [UIColor whiteColor];
  self.tabBar.frame = CGRectMake(0, screenHeight - 49.0, screenWidth, 49.0);
  
  _separateLine = [[UIView alloc] init];
  _separateLine.frame = CGRectMake(0, 0, screenWidth, 1.0);
  _separateLine.backgroundColor = [UIColor grayColorForBorder];
  [self.tabBar addSubview: _separateLine];

}

- (void)addItemsToSelf
{
  self.viewControllers = @[[[HomePageViewController alloc]init],
                           [[BasketViewController alloc] init],
                           [[MyViewController alloc] init],
                           [[MoreViewController alloc] init]];
  
  [self setItemStyle: self.tabBar.items[0]
               title: @"我的首页"
               image: @"2-1-home"
         selectImage: @"2-1-home-2"];
  
  [self setItemStyle: self.tabBar.items[1]
               title: @"洗衣篮"
               image: @"2-1-lanlan"
         selectImage: @"2-1-lanlan-2"];
  
  [self setItemStyle: self.tabBar.items[2]
               title: @"我"
               image: @"2-1-ren"
         selectImage: @"2-1-ren-2"];
  
  [self setItemStyle: self.tabBar.items[3]
               title: @"更多"
               image: @"2-1-more"
         selectImage: @"2-1-more-2"];
  
}

//MARK: - 设置tabBarItem的函数
- (void)setItemStyle:(UITabBarItem *)items
               title:(NSString *)title
               image:(NSString *)image
         selectImage:(NSString *)selectImage
{
  items.title = title;
  items.image = [UIImage imageNamed:image];
  items.selectedImage = [UIImage imageNamed: selectImage];
}

@end
