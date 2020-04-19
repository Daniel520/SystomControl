//
//  AppDelegate.m
//  SystemControl
//
//  Created by Daniel on 2020/4/19.
//  Copyright © 2020 Daniel. All rights reserved.
//

#import "AppDelegate.h"

//extern int freqTest(int cycles);
//
//static double GetCPUFrequency(void)
//{
//    volatile NSTimeInterval times[500];
//
//    int sum = 0;
//
//    for(int i = 0; i < 500; i++)
//    {
//        times[i] = [[NSProcessInfo processInfo] systemUptime];
//        sum += freqTest(10000);
//        times[i] = [[NSProcessInfo processInfo] systemUptime] - times[i];
//    }
//
//    NSTimeInterval time = times[0];
//    for(int i = 1; i < 500; i++)
//    {
//        if(time > times[i])
//            time = times[i];
//    }
//
//    double freq = 1300000.0 / time;
//    return freq;
//}

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    double freq = GetCPUFrequency();
//    NSLog(@"CPU Freq:%f",freq);
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
