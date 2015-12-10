//
//  HomePageViewController.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/27.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "HomePageViewController.h"
#import <Masonry/Masonry.h>
#import "ModelViewController.h"
#import "SingletonClothesViewController.h"
#import "HttpTool.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <RJImageLoader/UIImageView+RJLoader.h>

@interface HomePageViewController ()

@property (nonatomic) UIView        *navigationBar;
@property (nonatomic) UIImageView   *navigationTitle;
@property (nonatomic) UIButton      *locationButton;
@property (nonatomic) UIImageView   *hintImageView;
@property (nonatomic) UIScrollView  *scrollView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIButton      *SingletonButton;
@property (nonatomic) UIButton      *bagButton;
@property (nonatomic) UIButton      *homeSuppliesButton;
@property (nonatomic) UIButton      *otherButton;
@property (nonatomic) UIButton      *serviceNoteButton;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUI];
  [self getAds];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

//MARK: - 设置UI
- (void)setUI
{
  self.view.backgroundColor = [UIColor grayColorForBackground];
  
  //设置_navigationBar的属性与约束
  _navigationBar = [[UIView alloc] init];
  _navigationBar.backgroundColor = [UIColor whiteColor];
  [self.view addSubview: _navigationBar];
  [_navigationBar mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.trailing.leading.equalTo(self.view);
    make.height.equalTo(@64);
  }];
  
  //设置_navigationTitle的属性与约束
  _navigationTitle = [[UIImageView alloc] init];
  _navigationTitle.image = [UIImage imageNamed: @"6"];
  [self.view addSubview: _navigationTitle];
  [_navigationTitle mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.centerX.equalTo(self.view);
    make.bottom.equalTo(_navigationBar).offset(-10);
    make.width.equalTo(@78);
    make.height.equalTo(@18);
  }];
  
  //设置_locationButton的属性与约束
  _locationButton = [[UIButton alloc] init];
  [_locationButton setTitle: @"深圳"
                   forState: 0];
  [_locationButton setTitleColor: [UIColor blueForMainStyle]
                        forState: 0];
  [_locationButton titleLabel].font = fontAsHeitiSC15;
  [self.view addSubview: _locationButton];
  [_locationButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.bottom.equalTo(_navigationBar);
    make.width.height.equalTo(@44);
  }];
  
  //设置_hintImageView的属性与约束
  _hintImageView = [[UIImageView alloc]
                    initWithImage:[UIImage imageNamed: @"7-1"]];
  [self.navigationBar addSubview: _hintImageView];
  [_hintImageView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.equalTo(_locationButton);
    make.leading.equalTo(_locationButton.mas_trailing);
    make.width.equalTo(@11);
    make.height.equalTo(@7);
  }];
  
  //设置_scrollView的属性与约束
  _scrollView = [[UIScrollView alloc] init];
  [self.view addSubview: _scrollView];
  
  [_scrollView mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.trailing.equalTo(self.view);
    make.top.equalTo(_navigationBar.mas_bottom);
    make.height.equalTo(self.view).multipliedBy(0.238);
  }];
  
  //设置_pageControl的属性与约束
  _pageControl = [[UIPageControl alloc] init];
  _pageControl.currentPageIndicatorTintColor = [UIColor blueForMainStyle];
  _pageControl.tintColor = [UIColor grayColorForBackground];
  
  [self.view addSubview: _pageControl];
  [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
    make.trailing.equalTo(self.view).offset(-10);
    make.bottom.equalTo(_scrollView).offset(-10);
  }];
  
  //设置_SingletonButton的属性与约束
  _SingletonButton = [[UIButton alloc] init];
  [_SingletonButton setBackgroundImage: [UIImage imageNamed: @"1-0"]
                    forState:0];
  [_SingletonButton addTarget: self
                       action: @selector(SingletonButtonClick)
             forControlEvents: UIControlEventTouchUpInside];
  [self.view addSubview: _SingletonButton];
  [_SingletonButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.equalTo(_scrollView.mas_bottom).offset(10);
    make.leading.equalTo(self.view).offset(15);
  }];
  
  //设置_bagButton的属性与约束
  _bagButton = [[UIButton alloc] init];
  [_bagButton setBackgroundImage: [UIImage imageNamed: @"2-0"]
                        forState: 0];
  [_bagButton addTarget: self
                 action: @selector(_bagButtonClick)
       forControlEvents: UIControlEventTouchUpInside];
  [self.view addSubview: _bagButton];
  [_bagButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.top.equalTo(_scrollView.mas_bottom).offset(10);
    make.trailing.equalTo(self.view).offset(-15);
    make.leading.equalTo(_SingletonButton.mas_trailing).offset(10);
    make.height.width.equalTo(_SingletonButton);
  }];
  
  //设置_homeSuppliesButton的属性与约束
  _homeSuppliesButton = [[UIButton alloc] init];
  [_homeSuppliesButton setBackgroundImage: [UIImage imageNamed: @"3-0"]
                                 forState:0];
  [self.view addSubview: _homeSuppliesButton];
  [_homeSuppliesButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.equalTo(_SingletonButton);
    make.trailing.equalTo(_bagButton);
    make.height.equalTo(_SingletonButton);
    make.top.equalTo(_SingletonButton.mas_bottom).offset(10);
  }];
  
  //设置_otherButton的属性与约束
  _otherButton = [[UIButton alloc] init];
  [_otherButton setBackgroundImage: [UIImage imageNamed: @"4-0"]
                          forState:0];
  [self.view addSubview: _otherButton];
  [_otherButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.trailing.equalTo(_homeSuppliesButton);
    make.top.equalTo(_homeSuppliesButton.mas_bottom).offset(10);
    make.height.equalTo(_SingletonButton);
  }];
  
  //设置_serviceNoteButton的属性与约束
  _serviceNoteButton = [[UIButton alloc] init];
  [_serviceNoteButton setBackgroundImage: [UIImage imageNamed: @"5-0"]
                                forState: 0];
  [self.view addSubview: _serviceNoteButton];
  [_serviceNoteButton mas_makeConstraints:^(MASConstraintMaker *make)
  {
    make.leading.trailing.equalTo(_otherButton);
    make.top.equalTo(_otherButton.mas_bottom).offset(10);
    make.height.equalTo(_SingletonButton);
    make.bottom.equalTo(self.view).offset(-59);
  }];
}

//MARK: 请求广告页面数据
- (void)getAds
{
  [[HttpTool shardeInstance] getHomepageImage:^(NSArray *imageAddress) {
    
    NSLog(@"%@",imageAddress);  //------------ 验证地址是否请求回来
    
   //[self setImageView: imageAddress];  //-------阻塞线程
  
  }];
  
}

//MARK: 用于生成imageView并且设置pageContrl
- (void)setImageView:(NSArray *)imageAddress
{
  _scrollView.contentSize = CGSizeMake(screenWidth * imageAddress.count,
                                       _scrollView.frame.size.height);
  //设置_pageContrl
  _pageControl.numberOfPages = imageAddress.count;
  
  //循环往_scrollView上添加imageView
  for (int i = 0; i < imageAddress.count; i++) {
    __block UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(screenWidth * i,
                                 64,
                                 screenWidth,
                                 _scrollView.frame.size.height);
    [_scrollView addSubview: imageView];
    
    [imageView startLoader];
    [imageView sd_setImageWithURL: [[NSURL alloc] initWithString: imageAddress[i]]
                 placeholderImage: nil
                          options: SDWebImageCacheMemoryOnly | SDWebImageRefreshCached
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                           [imageView updateImageDownloadProgress: receivedSize / expectedSize];
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                          [imageView reveal];
                        }];
  }
}

//MARK: - _bagButton的点击事件
- (void)_bagButtonClick
{
  [self presentViewController: [[ModelViewController alloc] init]
                     animated: true
                   completion: nil];
}

//MARK: -“件洗”按钮的点击事件
- (void)SingletonButtonClick
{
  [self.navigationController pushViewController:[[SingletonClothesViewController alloc] init]
                                       animated: true];
}


@end
