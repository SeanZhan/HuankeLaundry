//
//  Defines.h
//  HuanKeLaundry
//
//  Created by zhan on 15/11/25.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#ifndef Defines_h
#define Defines_h
#endif

//MARK: - 定义常用字体

//定义Heiti SC字体格式
#define fontAsHeitiSC19  [UIFont fontWithName:@"Heiti SC" size:19]
#define fontAsHeitiSC17  [UIFont fontWithName:@"Heiti SC" size:17]
#define fontAsHeitiSC15  [UIFont fontWithName:@"Heiti SC" size:15]
#define fontAsHeitiSC12  [UIFont fontWithName:@"Heiti SC" size:12]

//定义“微软雅黑”的字体格式
#define fontAsMicrosoftYaHei22 [UIFont fontWithName:@"MicrosoftYaHei" size: 22]
#define fontAsMicrosoftYaHei19 [UIFont fontWithName:@"MicrosoftYaHei" size: 19]
#define fontAsMicrosoftYaHei17 [UIFont fontWithName:@"MicrosoftYaHei" size: 17]

//定义“汉真广标”字体
#define fontAsHZGB19 [UIFont fontWithName:@"汉真广标" size: 19]
#define fontAsHZGB17 [UIFont fontWithName:@"汉真广标" size: 17]

//MARK: - 定义两个全局变量，获取当前设备的屏幕宽度和高度
#define screenWidth  [[UIScreen mainScreen] bounds].size.width

#define screenHeight  [[UIScreen mainScreen] bounds].size.height

//MARK: - 定义获取Json数据的服务器地址
#define GET_ID            @"http://wentao.uicp.cn:5525/xy/login.php?name=%@&password=%@"
#define GET_HOMEPAGEIMAGE @"http://wentao.uicp.cn:7070/demo/ads.json"
#define CET_CLOTHESIMAGE  @"http://wentao"


#define MoreCellIconImageArray @[@"联系客服",@"常见问题",@"服务范围",@"关于我们",@"用户协议",@"意见反馈"]
#define MoreCellHintTextArray  @[@"联系客服",@"常见问题",@"服务范围",@"关于我们",@"用户协议",@"意见反馈"]

#define ButtonNameArray        @[@"春/秋装",@"夏装",@"冬装",@"皮衣"]




