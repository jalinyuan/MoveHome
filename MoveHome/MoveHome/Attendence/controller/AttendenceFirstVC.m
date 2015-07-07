//
//  AttendenceFirstVC.m
//  MoveHome
//
//  Created by jalin on 15/7/1.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "AttendenceFirstVC.h"
#import "IWTabBar.h"
#import "AttendceMiddleVC.h"
@interface AttendenceFirstVC ()


@end

@implementation AttendenceFirstVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"签到";
    [self setUpMiddle];
}
-(void)setUpMiddle{
    AttendceMiddleVC *middleVc=[[AttendceMiddleVC alloc]init];
    NSArray *constA=[Constrants constrants:self.middleView childeView:middleVc.view margin:0];
    [self.view addConstraints:constA];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
