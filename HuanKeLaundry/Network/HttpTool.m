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

static HttpTool *_instance = nil;

//MARK: 创建单例的方法
+ (instancetype)shardeNetwork
{
    
    if (_instance == nil) {
      _instance = [[[self class] alloc] init];
    }

  return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
  return _instance;
}

//MARK: - 用于验证用户名和密码的方法
- (void)getID//:(NSString *)Name :(NSString *)passworld
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  NSString *getID = @"http://wentao.uicp.cn:5525/xy/login.php?name=maizi&password=111111";
  
  [manager GET: getID
    parameters:nil
       success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
         
         NSString *result = [responseObject objectForKey: @"result"];
         
         NSLog(@"%@",result);
         
    
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    NSLog(@"Error: %@",error);
  }];
}

@end
