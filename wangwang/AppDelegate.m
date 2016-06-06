//
//  AppDelegate.m
//  wangwang
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MeansViewController.h"
#import <MaxLeap/MaxLeap.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  //创建窗口
  self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  //设置背景颜色
  self.window.backgroundColor=[UIColor whiteColor];
  //让窗口显示出来
  [self.window makeKeyAndVisible];
  
//  LoginViewController *loginVC=[[LoginViewController alloc]init];
//  
//  self.window.rootViewController=loginVC;
    
    MeansViewController *meansVC = [[MeansViewController alloc]init];
    
    meansVC.name = @"骚猪";
    
    meansVC.sex = @"女";
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:meansVC];
    
    self.window.rootViewController = nc;
  
    [MaxLeap setApplicationId:@"5752763f169e7d0001c8298e" clientKey:@"bnlRNl84WkFuVkFyWjhjZXBfb0ltQQ" site:MLSiteCN];
    
    MLObject *obj = [MLObject objectWithoutDataWithClassName:@"Test" objectId:@"561c83c0226"];
    [obj fetchIfNeededInBackgroundWithBlock:^(MLObject * _Nullable object, NSError * _Nullable error) {
      if (error.code == kMLErrorInvalidObjectId) {
        NSLog(@"已经能够正确连接上您的云端应用");
      } else {
        NSLog(@"应用访问凭证不正确，请检查。");
      }
    }];

  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
