//
//  DemoOneViewController.m
//  shuziWeike
//
//  Created by jalin on 15/6/24.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//
#import <QuartzCore/CALayer.h>
#import <Foundation/NSObject.h>
#import "DemoOneViewController.h"
#import "IWNavigationController.h"
#import "UIImage+MJ.h"
#import "MessageLeftVC.h"
#import "MessageRightVC.h"
#import "MessageFirstVC.h"
#import "AttendenceFirstVC.h"
#import "OfficeworkFirstVC.h"
#import "AddressListFirstVC.h"
#import "RESideMenu.h"
#import "KxMenu.h"
#import "SetUpVC.h"
#import "UIColor+BFPaperColors.h"
#import "ContextMenuCell.h"
#import "YALContextMenuTableView.h"
#import "YALNavigationBar.h"
#import "TestOneVC.h"
#import "TESTBB.h"


static NSString *const menuCellIdentifier = @"rotationCell";
@interface DemoOneViewController ()
<
  IWTabBarDelegate,
  UITableViewDelegate,
  RESideMenuDelegate,
  UITableViewDataSource,
  YALContextMenuTableViewDelegate,
  UIGestureRecognizerDelegate
>
@property (nonatomic, strong) YALContextMenuTableView* contextMenuTableView;

@property (nonatomic, strong) NSArray *menuTitles;
@property (nonatomic, strong) NSArray *menuIcons;
//
@property(nonatomic,strong)NSString *subTitle;

@end

@implementation DemoOneViewController
-(YALContextMenuTableView *)contextMenuTableView{
    if (!_contextMenuTableView) {
        _contextMenuTableView = [[YALContextMenuTableView alloc]initWithTableViewDelegateDataSource:self];
        _contextMenuTableView.animationDuration = 0.15;
        //optional - implement custom YALContextMenuTableView custom protocol
        _contextMenuTableView.yalDelegate = self;
        
        //register nib
        UINib *cellNib = [UINib nibWithNibName:@"ContextMenuCell" bundle:nil];
        [_contextMenuTableView registerNib:cellNib forCellReuseIdentifier:menuCellIdentifier];
    }
    
    return _contextMenuTableView;

}
-(UIView *)middleView{
    if (!_middleView) {
        _middleView=[[UIView alloc]init];
    }
    _middleView.backgroundColor=[UIColor whiteColor];
    return _middleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
     //初始化右上角YAL菜单
   // [self initiateMenuOptions];
    // set custom navigationBar with a bigger height
    //[self.navigationController setValue:[[YALNavigationBar alloc]init] forKeyPath:@"navigationBar"];
     [self setUpNav:@"消息"];
    
    self.tabbar=[[IWTabBar alloc]initWithArray:1];
    _tabbar.delegate=self;
    NSArray *consta=[self constrants: self.tabbar superView:self.view middleView:self.middleView];
    [self.view addConstraints:consta];
    
}

-(NSArray *)constrants:(IWTabBar *)tabbar superView:(UIView *)superview  middleView:(UIView *)middleview{
    [self.view addSubview:middleview];
    [self.view addSubview:tabbar];
    tabbar.translatesAutoresizingMaskIntoConstraints=NO;
    middleview.translatesAutoresizingMaskIntoConstraints=NO;
    NSDictionary *views=NSDictionaryOfVariableBindings(tabbar,superview,middleview);
    NSDictionary   *metrics=@{@"blueheight":@55,@"redheight":@180,@"barheight":@1,@"margin":@0};
    NSArray *constA=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[tabbar]-margin-|" options:0 metrics:metrics views:views];
    NSArray *constA3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[middleview]-margin-|" options:0 metrics:metrics views:views];
    NSArray *constA2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[middleview]-margin-[tabbar(==blueheight)]-margin-|" options:NSLayoutFormatAlignAllLeading|NSLayoutFormatAlignAllTrailing metrics:metrics views:views];
    NSArray *constE=[constA arrayByAddingObjectsFromArray:constA3];
    NSArray *constE2=[constE arrayByAddingObjectsFromArray:constA2];
    return constE2;
}
/**
[""] *	@brief	自定义一个tabbar
[""] *
[""] *	@param 	indexNum{ 	实例化传入方便后面默认选中
[""] *
[""] *	@return
[""] */
//-(IWTabBar *)setupTabbar :(NSUInteger)indexNum{
//
//
//    return tabbar;
//}



-(void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to{
    NSLog(@"%i......%i",from ,to);
    
    IWNavigationController   *unav=nil;
    MessageFirstVC *message=nil;
    AttendenceFirstVC *attendence=nil;
    AddressListFirstVC *address=nil;
    OfficeworkFirstVC *office=nil;
    MessageLeftVC *leftMenuViewController = [[MessageLeftVC alloc] init];
    MessageRightVC *rightMenuViewController = [[MessageRightVC alloc] init];
    
    switch (to) {
        case 0:
            message=[[MessageFirstVC alloc]initWithNibName:@"MessageFirstVC" bundle:nil];
            unav = [[IWNavigationController alloc] initWithRootViewController:message];
            
            break;
        case 1:
            address=[[AddressListFirstVC alloc]init];
            unav=[[IWNavigationController alloc]initWithRootViewController:address];
            break;
        case 2:
            attendence=[[AttendenceFirstVC alloc]init];
            unav=[[IWNavigationController alloc]initWithRootViewController:attendence];
            break;
        case 3:
            office=[[OfficeworkFirstVC alloc]init];
            unav=[[IWNavigationController alloc]initWithRootViewController:office];
            break;
            
        default:
            break;
    }
    RESideMenu *menu=[UIImage MenuwithContentView:unav leftVC:leftMenuViewController rightVC:rightMenuViewController];
    menu.delegate=self;
    [UIApplication sharedApplication].keyWindow.rootViewController=menu;

}


-(void)setUpNav:(NSString *)title{
    //自定义button作为leftleftbarbuttonitem（避免背景的颜色遮盖button原本的颜色）
     UIButton *leftBtn= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage:[UIImage imageNamed:@"tabbar_profile"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRight:) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (void) clickRight:(id)sender
{
    NSArray *menuItems =
    @[
      [KxMenuItem menuItem:@"会话设置"
                     image:[UIImage imageNamed:@"action_icon"]
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"最近文件"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"会话纪录"
                     image:[UIImage imageNamed:@"reload"]
                    target:self
                    action:@selector(pushMenuItem:)],
      ];
    
    KxMenuItem *first = menuItems[0];
   // first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    CGRect frame=CGRectMake(self.view.frame.size.width, -15, 0, 0);
    [KxMenu showMenuInView:self.view
                  fromRect:frame
                 menuItems:menuItems];

}
-(void)pushMenuItem:(UIBarButtonItem *)sender{

    NSLog(@",.....,,,");
}

#pragma mark - IBAction

#pragma mark - Local methods
//
//- (void)initiateMenuOptions {
//    self.menuTitles = @[@"",
//                        @"会话设置",
//                        @"最近文件",
//                        @"会话纪录",
//                        //                        @"Add to favourites",
//                        //                        @"Block user"
//                        ];
//    
//    self.menuIcons = @[[UIImage imageNamed:@"Icnclose"],
//                       [UIImage imageNamed:@"SendMessageIcn"],
//                       [UIImage imageNamed:@"LikeIcn"],
//                       [UIImage imageNamed:@"AddToFriendsIcn"],
//                       //                       [UIImage imageNamed:@"AddToFavouritesIcn"],
//                       //                       [UIImage imageNamed:@"BlockUserIcn"]
//                       ];
//    
//    
//}
//


@end
