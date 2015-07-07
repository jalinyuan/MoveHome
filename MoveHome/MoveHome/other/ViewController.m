//
//  ViewController.m
//  MoveHome
//
//  Created by jalin on 15/6/30.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar2" forKey:@"foo2"];//TestObject:数据库表名，forKey:字段名，setObject:值
    [testObject save];
 NSString *barValue=   [testObject objectForKey:@"foo"];
    NSLog(@"%@",barValue);
}
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

@end
