//
//  AppDelegate.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/4.
//

#import "AppDelegate.h"
#import "SingleAViewController.h"
#import "BlockAViewController.h"
#import "DelegateViewController.h"
#import "DelegateAViewController.h"
#import "OtherWayAViewController.h"
#import "NotificationCenterAVController.h"
#import "KVOCaseOneViewController.h"
#import "KVOCaseTwoViewController.h"
#import "KVOCaseThreeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    KVOCaseTwoViewController *vc = [[KVOCaseTwoViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
