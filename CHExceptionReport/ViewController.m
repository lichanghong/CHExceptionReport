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
        NSArray *arr = [NSArray array];
 
    [CHBugly configBugly];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
