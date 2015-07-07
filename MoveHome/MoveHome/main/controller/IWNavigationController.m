//
//  IWNavigationController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWNavigationController.h"
//#import "UIBarButtonItem+MJ.h"

@interface IWNavigationController ()

@end

@implementation IWNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
//    // 设置背景
//    if (!iOS7) {
//        [item setBackgroundImage:[UIImage imageWithName:@"tabbar_background_os7"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//        [item setBackgroundImage:[UIImage imageWithName:@"tabbar_background_os7"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//        [item setBackgroundImage:[UIImage imageWithName:@"tabbar_background_os7"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
//    }
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 15 : 12];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[UITextAttributeTextColor] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景
   // if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"tabbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //}
    
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:textAttrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back" highIcon:@"navigationbar_back_highlighted" target:self action:@selector(back)];
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_more" highIcon:@"navigationbar_more_highlighted" target:self action:@selector(more)];

    }
    [super pushViewController:viewController animated:animated];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end