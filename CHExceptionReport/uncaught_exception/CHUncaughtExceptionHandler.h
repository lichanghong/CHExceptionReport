//
//  CHUncaughtExceptionHandler.h
//  CHExceptionReport
//
//  Created by lichanghong on 5/12/17.
//  Copyright © 2017 lichanghong. All rights reserved.
//


/*
 ************ 使用方式
 
 #import "CHUncaughtExceptionHandler.h"
 
 @interface AppDelegate ()
 
 @end
 
 @implementation AppDelegate
 
 
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 [CHUncaughtExceptionHandler setDefaultHandler];
 
 
 // Override point for customization after application launch.
 return YES;
 }
 
 */
#import <Foundation/Foundation.h>

@interface CHUncaughtExceptionHandler : NSObject
+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)handler;
+ (void)TakeException:(NSException *) exception;


@end

 

