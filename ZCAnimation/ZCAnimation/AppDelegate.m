//
//  AppDelegate.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/9.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController *mainCtrl = [MainViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainCtrl];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
