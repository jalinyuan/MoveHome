//
//  CLTreeViewOneCell.h
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTreeViewNode.h"

@protocol CLTreeViewOneCellDelegate <NSObject>
-(void)clickButton:(NSInteger)index withTitle:(NSString *)title;

@end
@interface CLTreeViewOneCell : UITableViewCell

@property(nonatomic,strong)id<CLTreeViewOneCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleText;
- (IBAction)editAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *start5;
@property (retain,strong,nonatomic) CLTreeViewNode *node; //data
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;

@end
