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

//定义navigationTitle的字体格式
#define fontAsHeitiSC19  [UIFont fontWithName:@"Heiti SC" size:19]
#define fontAsHeitiSC15  [UIFont fontWithName:@"Heiti SC" size:15]
#define fontAsHeitiSC12  [UIFont fontWithName:@"Heiti SC" size:12]


//MARK: - 定义两个全局变量，获取当前设备的屏幕宽度和高度
#define screenWidth  [[UIScreen mainScreen] bounds].size.width

#define screenHeight  [[UIScreen mainScreen] bounds].size.height

//MARK: - 定义获取Json数据的服务器地址
#define WEB_SERVER  @"http://wentao.uicp.cn:5525/"
#define GET_ID      @"xy/login.php?name=%@&password=%@"





