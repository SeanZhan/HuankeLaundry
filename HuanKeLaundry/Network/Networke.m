//
//  Networke.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "Networke.h"
#import <AFNetworking/AFNetworking.h>

static Networke *networke = nil;

@implementation Networke

+ (Networke *)shardeNetwork
{
  static dispatch_once_t oneceToken = 0;
  dispatch_once(&oneceToken, ^{
    
    networke = [[[self class] alloc] init];

  });
  return networke;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
  return networke;
}

//MARK: - 用于验证用户名和密码的方法
- (void)getID//:(NSString *)Name :(NSString *)passworld
{
  NSLog(@"1");     //999999999999
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
  NSString *getID = @"http://wentao.uicp.cn:5525/xy/login.php?name=maizi&password=111111";
  
  [manager GET: getID
    parameters:nil
       success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
         
         NSString *result = [responseObject
                        objectForKey: @"result"];
         
         NSLog(@"%@",result);
         
    
  } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    NSLog(@"Error: %@",error);
  }];
}

@end
