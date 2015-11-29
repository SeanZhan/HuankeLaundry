//
//  MoreCellFunction.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/29.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreCellModel : NSObject

@property (nonatomic) NSString *iconImageName;
@property (nonatomic) NSString *hintLabelText;

- (instancetype)initWithIconImageName:(NSString *)iconImageName
                         hintLabelTex:(NSString *)hintLabelText;

@end
