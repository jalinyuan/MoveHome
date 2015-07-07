//
//  DemoOneViewController.h
//  shuziWeike
//
//  Created by jalin on 15/6/24.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWTabBar.h"

// Nice circle diameter constants with ugly names:
extern CGFloat const bfPaperTabBarController_tapCircleDiameterMedium;
extern CGFloat const bfPaperTabBarController_tapCircleDiameterSmall;
extern CGFloat const bfPaperTabBarController_tapCircleDiameterLarge;
extern CGFloat const bfPaperTabBarController_tapCircleDiameterFull;
extern CGFloat const bfPaperTabBarController_tapCircleDiameterDefault;

@interface DemoOneViewController : UIViewController
@property(nonatomic,strong)UIView *middleView;
@property(nonatomic,strong)IWTabBar *tabbar;
@property(nonatomic,strong)NSString  *numbers;
@property(nonatomic,strong)UITableViewCell *cell;
@property(nonatomic,strong) NSString *identify;
-(void)setUpNav:(NSString *)title;

/**
[""] *	@brief 子类重写该方法，即可以自定义标题
[""] *
[""] *	@param 	title 	标题
[""] *
[""] *	@return
[""] */






@end

