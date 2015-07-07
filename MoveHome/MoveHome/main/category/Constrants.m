//
//  Constrants.m
//  MoveHome
//
//  Created by jalin on 15/7/3.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "Constrants.h"

@implementation Constrants
/**
[""] *	@brief
[""] *
[""] *	@param 	supview 	父控件
[""] *	@param 	view 	子控件
[""] *	@param 	margin{ 	间距
[""] *
[""] *	@return	返回一组约束（子控件于父控件四个方向的间距都为margin）
[""] */
+(NSArray *)constrants:(UIView *)supview childeView:(UIView *)view margin:(int)margin{
    NSDictionary *views=NSDictionaryOfVariableBindings(supview,view);
    NSString *mar=[NSString stringWithFormat:@"%d",margin];
    view.translatesAutoresizingMaskIntoConstraints=NO;
    [supview addSubview:view];
    NSArray *constA=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[view]-margin-|" options:0 metrics: @{@"margin":mar} views:views];
    NSArray *constA2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[view]-margin-|" options:0 metrics: @{@"margin":mar} views:views];
    NSArray *constE=[constA arrayByAddingObjectsFromArray:constA2];
    return constE;
}

@end
