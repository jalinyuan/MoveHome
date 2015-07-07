//
//  IWTabBar.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWTabBar.h"
#import "IWTabBarButton.h"
@interface IWTabBar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) UIButton *plusButton;
@property (nonatomic, weak) IWTabBarButton *selectedButton;
@end

@implementation IWTabBar

-(id)initWithArray:(NSUInteger )index{
    self=[super init];
    if (self) {
        [self setUpChild:index ];
    }
    return self;
}
- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
-(void)setUpChild:(NSUInteger)index {

   
        
        [self setupChildViewController:nil title:@"消息" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected" index:index];

    
        [self setupChildViewController:nil title:@"通讯录" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected" index:index];
 
 
 
         [self setupChildViewController:nil title:@"考勤" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected" index:index];
 

        [self setupChildViewController:nil title:@"办公" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected" index:index];

    

    
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      //  if (!iOS7) { // 非iOS7下,设置tabbar的背景
        
          self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background_os7"]];
       // }
        
        // 添加一个加号按钮
//        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
//        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
//        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
//        [plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:plusButton];
//        self.plusButton = plusButton;
    }
    return self;
}
-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *) imageName selectedImageName:(NSString *)selectedImageName index:(NSUInteger)index{
    
    UITabBarItem *item=[[UITabBarItem alloc]init];
    item.title=title;
    item.image=[UIImage imageNamed:imageName];
    //
    item.selectedImage=[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addaddTabBarButtonWithItem:item index:index];
    
}
-(void)addaddTabBarButtonWithItem:(UITabBarItem *)item index:(NSUInteger)index {
    //创建button
    IWTabBarButton *button=[[IWTabBarButton alloc]init];
    [self addSubview: button];
    button.item=item;
    //设置数据
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        //默认选中第0个按钮
        if(self.subviews.count==index){
           [self buttonClick:button];
        }
    
}

- (void)plusButtonClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    IWTabBarButton *button = [[IWTabBarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(IWTabBarButton *)button
{
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor=IWColor(241, 242, 243);
    CGFloat buttony=0;
    CGFloat buttonw=self.frame.size.width / self.subviews.count;
    CGFloat buttonh=self.frame.size.height;;
    NSLog(@"%lu",(unsigned long)[self.subviews count]);
    for (int index=0; index < self.subviews.count ; index++) {
        UIButton *button=self.subviews[index];
        //设置按钮的frame
        CGFloat buttonX=index * buttonw;
        button.frame=CGRectMake(buttonX, buttony, buttonw, buttonh);
        //给button绑定tag
        button.tag=index;
    }
}

@end
