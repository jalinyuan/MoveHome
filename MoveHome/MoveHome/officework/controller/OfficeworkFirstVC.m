//
//  OfficeworkFirstVC.m
//  MoveHome
//
//  Created by jalin on 15/7/1.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "OfficeworkFirstVC.h"
#import "IWTabBar.h"
#import "OfficeworkVC.h"
@interface OfficeworkFirstVC ()


@property(nonatomic,strong)UIView *middle;

@end

@implementation OfficeworkFirstVC
-(UIView *)middle{
    if (!_middle) {
        _middle=[[OfficeWorkVC alloc]init].view;
        _middle.frame=self.middleView.frame;
        
    }
    [self.middleView addSubview:_middle];
    return _middle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加顶部自定义tabbar
    self.title=@"办公";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
