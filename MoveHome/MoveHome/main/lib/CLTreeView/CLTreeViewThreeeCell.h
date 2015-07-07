//
//  CLTreeViewThreeeCell.h
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTreeViewNode.h"
@protocol CLTreeViewThreeeCellDelegate<NSObject>
-(void)clickButtonThree:(NSInteger)index withTitle:(NSString *)title;
@end
@interface CLTreeViewThreeeCell : UITableViewCell

@property(weak ,nonatomic) id<CLTreeViewThreeeCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *TitleText;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;
- (IBAction)editAction:(id)sender;
@property (retain,strong,nonatomic) CLTreeViewNode *node;//data
@end
