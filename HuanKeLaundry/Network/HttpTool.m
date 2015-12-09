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
  
  NSString *ID = [NSString stringWithFormat:@"http://wentao.uicp.cn:5525/xy/login.php?name=%@&password=%@",Name,passworld];
  
  [manager GET: ID
    parameters: nil
       success: ^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    
         NSString *loginResult = [responseObject objectForKey: @"result"];
        
         completionHandler(loginResult);
         
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    NSLog(@"Error: %@",error);
  }];
}

@end
