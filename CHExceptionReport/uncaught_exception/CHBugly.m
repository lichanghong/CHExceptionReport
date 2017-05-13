//
//  CHBugly.m
//  CHExceptionReport
//
//  Created by lichanghong on 5/13/17.
//  Copyright © 2017 lichanghong. All rights reserved.
//

#import "CHBugly.h"

@implementation CHBugly

+ (void)configBugly
{
    NSArray *arr = [NSArray array];
    NSLog(@"Init Bugly");
    BuglyConfig *config = [[BuglyConfig alloc]init];
    config.debugMode = true;
    config.viewControllerTrackingEnable = true;
    config.reportLogLevel = BuglyLogLevelWarn;
    [Bugly startWithAppId:@"47aa26f7bb" config:config];
    
    BLYLogWarn(@"Swift Log Print %@", @"Test");
    BLYLogError(@"Swift Log Print %@", @"Test");
    
    [Bugly reportError:nil];
    dispatch_async(dispatch_queue_create("skdflkds", 0), ^{
        while (true) {
            BLYLogError(@"Test %@", @"Error");
            
            BLYLogWarn(@"Test %@", @"WARN");
            
            sleep(1);
            
            BLYLogInfo(@"Test %@",@"INFO");
            arr[1];
        }
    });
   
}

@end
