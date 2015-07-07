//
//  CLTreeVIewTwoCell.h
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTreeViewNode.h"

@protocol CLTreeVIewTwoCellDelegat<NSObject>
-(void)clickButtonTwo:(NSInteger)index  withTitle:(NSString *)title;
@end
@interface CLTreeVIewTwoCell : UITableViewCell
@property(weak,nonatomic)id<CLTreeVIewTwoCellDelegat> delegate;
@property (weak, nonatomic) IBOutlet UILabel *TitleText;
- (IBAction)editAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (retain,strong,nonatomic) CLTreeViewNode *node;//data
@property (strong,nonatomic) IBOutlet UILabel *sonCount;//叶子数
@end
