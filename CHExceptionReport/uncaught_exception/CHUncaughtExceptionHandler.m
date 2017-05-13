//
//  CHUncaughtExceptionHandler.m
//  CHExceptionReport
//
//  Created by lichanghong on 5/12/17.
//  Copyright © 2017 lichanghong. All rights reserved.
//

#import "CHUncaughtExceptionHandler.h"

NSString * applicationDocumentDir()
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
}

void UncaughtExceptionHandler(NSException * exception)
{
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason]; // // 崩溃的原因  可以有崩溃的原因(数组越界,字典nil,调用未知方法...) 崩溃的控制器以及方法
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentDir() stringByAppendingPathComponent:@"Exception.txt"];
    // 将一个txt文件写入沙盒
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

@implementation CHUncaughtExceptionHandler

// 沙盒地址
- (NSString *)applicationDocumentsDirectory {
    return applicationDocumentDir();
}

+ (void)setDefaultHandler {
      NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
    // 发送崩溃日志
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [path stringByAppendingPathComponent:@"Exception.txt"];
    NSData *data = [NSData dataWithContentsOfFile:dataPath];
    if (data != nil) {
        [CHUncaughtExceptionHandler sendExceptionLogWithData:data path:dataPath];
    }
}

#pragma mark -- 发送崩溃日志
+ (void)sendExceptionLogWithData:(NSData *)data path:(NSString *)path {
    NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"result = %@",result);
    
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.requestSerializer.timeoutInterval = 5.0f;
    //    //告诉AFN，支持接受 text/xml 的数据
    //    [AFJSONResponseSerializer serializer].acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    //    NSString *urlString = @"后台地址";
    //
    //    [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //        [formData appendPartWithFileData:data name:@"file" fileName:@"Exception.txt" mimeType:@"txt"];
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
    //        // 删除文件
    //        NSFileManager *fileManger = [NSFileManager defaultManager];
    //        [fileManger removeItemAtPath:path error:nil];
    //
    //    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
    //        
    //        
    //    }];
}

+ (NSUncaughtExceptionHandler *)handler {
    return NSGetUncaughtExceptionHandler();
}

+ (void)TakeException:(NSException *)exception {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason];
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentDir() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
