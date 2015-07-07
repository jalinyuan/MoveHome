//
//  IWTabBarViewController.m
//  MoveHome
//
//  Created by jalin on 15/7/1.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "IWTabBarViewController.h"
#import "IWTabBar.h"
#import "AddressListFirstVC.h"
#import "AttendenceFirstVC.h"
#import "OfficeworkFirstVC.h"
#import "MessageFirstVC.h"
#import "IWNavigationController.h"
@interface IWTabBarViewController ()<IWTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) IWTabBar *customTabBar;
@property (nonatomic, strong) AddressListFirstVC *addresslist;
@property (nonatomic, strong) AttendenceFirstVC *attendce;
// 3.广场
@property (nonatomic, strong) OfficeworkFirstVC *office;
// 4.我
@property (nonatomic, strong) MessageFirstVC *message;

@end

@implementation IWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}
/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    IWTabBar *customTabBar = [[IWTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}
/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.消息
    MessageFirstVC *message = [[MessageFirstVC alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.message = message;
    
    // 2.通讯录
    AddressListFirstVC *addresslist = [[AddressListFirstVC alloc] init];
    [self setupChildViewController:addresslist title:@"通讯录" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.addresslist = addresslist;
    
    // 3.考勤
    AttendenceFirstVC *attendce = [[AttendenceFirstVC alloc] init];
    [self setupChildViewController:attendce title:@"考勤" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    self.attendce = attendce;
    
    // 4.办公
    OfficeworkFirstVC *office = [[OfficeworkFirstVC alloc] init];
    [self setupChildViewController:office title:@"办公" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.office = office;
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
      childVc.tabBarItem.selectedImage = selectedImage;
   }
    
    // 2.包装一个导航控制器
    //IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:childVc];
  //  IWTabBarViewController *nav=[[IWTabBarViewController alloc]init];
   [self addChildViewController:childVc];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
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
