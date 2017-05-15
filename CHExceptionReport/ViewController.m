//
//  ViewController.m
//  CHExceptionReport
//
//  Created by lichanghong on 5/12/17.
//  Copyright © 2017 lichanghong. All rights reserved.
//

#import "ViewController.h"
#import "CHUncaughtExceptionHandler.h"
#import "CHBugly.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//        NSArray *arr = [NSArray array];
// 
//    [CHBugly configBugly];
    
    //core foundation
//    CFRunLoopGetMain();
//    CFRunLoopRef runloop = CFRunLoopGetCurrent();
//    CFRunLoopMode mode = CFRunLoopCopyCurrentMode(runloop);
//    CFStringRef str2  = CFSTR("UIInitializationRunLoopMode");
//    CFComparisonResult result = CFStringCompare(mode, str2, kCFCompareCaseInsensitive);
//    if (result == kCFCompareEqualTo) {
//        NSLog(@"is equal");
//    }
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSDateFormatter *df = [[NSDateFormatter alloc]init];
//        df.dateFormat = @"dd-hh-mm-ss";
//        df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:(+8)*3600];
//        NSString *ct  = [df stringFromDate:[NSDate date]];
//        NSLog(@"%@",ct);
//  
//    }];
// 
    
    
//    CFRunLoopObserverRef ob = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        NSLog(@"监听到RunLoop发生改变---%zd",activity);
//
//    });
//    CFRunLoopAddObserver(runloop, ob, kCFRunLoopDefaultMode);
//    CFRelease(ob);
    
//    UIImageView *iv = [UIImageView new];
//    [iv performSelector:@selector(setImage:) withObject:@"" afterDelay:4 inModes:@[NSDefaultRunLoopMode]];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}

- (void)run
{
    // 这里写任务
    NSLog(@"----run1-----");
    [[NSRunLoop currentRunLoop]addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    
//    // 添加下边两句代码，就可以开启RunLoop，之后self.thread就变成了常驻线程，可随时添加任务，并交于RunLoop处理
//    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];
//    
//    // 测试是否开启了RunLoop，如果开启RunLoop，则来不了这里，因为RunLoop开启了循环。
    NSLog(@"未开启RunLoop");
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    CFRunLoopRef runloop = CFRunLoopGetCurrent();
//    NSLog(@"%@",runloop);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
