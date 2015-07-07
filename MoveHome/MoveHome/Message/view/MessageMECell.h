//
//  MessageCell.h
//  MoveHome
//
//  Created by jalin on 15/7/6.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NZCircularImageView.h"
@class Message;
@interface MessageMECell : UITableViewCell
@property(nonatomic,strong)Message *message;
@property (weak, nonatomic) IBOutlet NZCircularImageView *headP;
@property (weak, nonatomic) IBOutlet UILabel *titleP;
@property (weak, nonatomic) IBOutlet UILabel *detailP;
@property (weak, nonatomic) IBOutlet UIButton *edgeButton;

@end
