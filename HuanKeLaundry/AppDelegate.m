//
//  AppDelegate.m
//  HuanKeLaundry
//
//  Created by zhan on 15/11/25.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideViewController.h"
#import "LoginViewController.h"
#import "HomePageViewController.h" //------->>>临时
#import "MoreViewController.h"     //------->>>临时
#import "MyViewController.h"       //------->>>临时
#import "TabBarController.h"      //-------->>>临时

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController: [[GuideViewController alloc] init]];
  [nv setNavigationBarHidden: true];
  self.window.rootViewController = nv;
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
