//
//  ViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/25.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "GuideViewController.h"
#import <Masonry/Masonry.h>
#import "LoginViewController.h"

@interface GuideViewController ()


@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) UIButton *loginButton;

@end

@implementation GuideViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

//MARK: - 设置UI
- (void)setUI
{
  NSArray *imageArray = @[@"0-引-1",@"0-引-2",@"0-引-3"];
  _scrollView = [[UIScrollView alloc] init];
  _scrollView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
  _scrollView.contentSize = CGSizeMake(screenWidth * imageArray.count, screenHeight);
  _scrollView.showsHorizontalScrollIndicator = false;
  _scrollView.showsVerticalScrollIndicator = false;
  _scrollView.pagingEnabled = true;
  self.automaticallyAdjustsScrollViewInsets = false; //取消自动留白
  [self.view addSubview: _scrollView];
  
  //循环往_scrollView添加imageView
  for (int i = 0; i < imageArray.count; ++i) {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(i * screenWidth, 0, screenWidth, screenHeight);
    imageView.image = [UIImage  imageNamed: imageArray[i]];
    [_scrollView addSubview: imageView];
  }
  
  //添加loginButton以及设置其约束
  _loginButton = [[UIButton alloc] init];
  [_loginButton setImage:[UIImage imageNamed:@"0-1-1"] forState: 0];
  [_loginButton addTarget:self
                   action: @selector(loginButtonClick)
         forControlEvents: 1 <<  6];
  [self.view addSubview: _loginButton];
  
  
  [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.view);
    make.width.equalTo(self.view).multipliedBy(0.47);
    make.height.equalTo(_loginButton.mas_width).multipliedBy(0.23);
    make.bottom.equalTo(self.view).offset(-55);
  }];
}

//MARK: - loginButton点击事件
- (void)loginButtonClick
{
  UIViewController *vc = [[LoginViewController alloc] init];
  [self.navigationController pushViewController:vc animated:true];
}

@end
