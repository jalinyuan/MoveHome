//
//  TESTBB.m
//  MoveHome
//
//  Created by jalin on 15/7/4.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "TESTBB.h"
#import "LNBRippleEffect.h"
@interface TESTBB ()

@end

@implementation TESTBB

- (void)viewDidLoad {
    [super viewDidLoad];
    LNBRippleEffect* rippleEffect = [[LNBRippleEffect alloc]
        initWithImage:[UIImage imageNamed:@"BtnAdd"]
                Frame:CGRectMake(110, 200, 100, 100)
                Color:[UIColor colorWithRed:(28.0 / 255.0)
                                      green:(212.0 / 255.0)
                                       blue:(255.0 / 255.0)
                                      alpha:1]
               Target:@selector(buttonTapped:)
                   ID:self];
    [rippleEffect setRippleColor:[UIColor colorWithRed:(28.0 / 255.0)
                                                 green:(212.0 / 255.0)
                                                  blue:(255.0 / 255.0)
                                                 alpha:1]];
    [rippleEffect setRippleTrailColor:[UIColor colorWithRed:(28.0 / 255.0)
                                                      green:(212.0 / 255.0)
                                                       blue:(255.0 / 255.0)
                                                      alpha:0.5]];
    [self.view addSubview:rippleEffect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
