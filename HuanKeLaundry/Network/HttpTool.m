//
//  Networke.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation HttpTool

//MARK: 创建单例的方法
+ (instancetype)shardeInstance
{
  static HttpTool *_instance = nil;
  
  dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    
    if (_instance == nil) {
      _instance = [[[self class] alloc] init];
    }
  });
  return _instance;
}

//MARK: - 用于验证用户名和密码的方法
- (void)getID:(NSString *)Name
     password:(NSString *)passworld
completionHandler: (void (^)(NSString *result))completionHandler
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"]; 
  
  NSString *ID = [NSString stringWithFormat: GET_ID,Name,passworld];
  
  [manager GET: ID
    parameters: nil
       success: ^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    
         NSString *loginResult = [responseObject objectForKey: @"result"];
        
         completionHandler(loginResult);
         
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    NSLog(@"Error: %@",error);
  }];
}

//MARK: - 获取首页的图片
- (void)getHomepageImage: (void (^)(NSArray *imageAddress))completionHandler
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
  
  [manager GET: GET_HOMEPAGEIMAGE
    parameters: nil
       success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {

         NSArray *adsArray = [responseObject objectForKey: @"ads"];
         
         NSMutableArray *imageURLArray = [NSMutableArray array];
         
         for (int i = 0; i < adsArray.count; i++) {
           NSString *imageURL = [adsArray[i] objectForKey: @"image"];
           [imageURLArray addObject: imageURL];
         }
         completionHandler(imageURLArray);
       }
       failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
          NSLog(@"Error: %@",error);
       }];

}

@end
