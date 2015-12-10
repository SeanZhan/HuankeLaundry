//
//  Networke.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/26.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

+ (instancetype)shardeInstance;

- (void)getID:(NSString *)Name
     password:(NSString *)passworld
completionHandler: (void (^)(NSString *result))completionHandler;

- (void)getHomepageImage: (void (^)(NSArray *imageAddress))completionHandler;

@end
