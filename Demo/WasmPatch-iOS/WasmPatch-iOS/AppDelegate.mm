//
//  AppDelegate.m
//  WasmPatch-iOS
//
//  Created by everettjf on 2020/4/6.
//  Copyright © 2020 everettjf. All rights reserved.
//

#import "AppDelegate.h"
#import <WasmPatch-TestCase/TestRunner.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //创建窗口的根控制器，并且赋值
    UIViewController *rootVc = [UIViewController new];
    self.window.rootViewController = rootVc;
    //显示窗口
    [self.window makeKeyAndVisible];
    
    NSString *testCaseBundlePath = [[NSBundle mainBundle] pathForResource:@"WasmPatch-TestCase" ofType:@"bundle"];
    NSString *scriptBundlePath = [testCaseBundlePath stringByAppendingPathComponent:@"script.bundle"];
    [TestRunner runTest:scriptBundlePath];
    
    return YES;
}

@end
