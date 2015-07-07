//
//  MessageCell.m
//  MoveHome
//
//  Created by jalin on 15/7/6.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "MessageMECell.h"
#import "AFNetworking.h"
#import "Message.h"

@implementation MessageMECell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setMessage:(Message *)message{
    _message=message;
    NSLog(@"%@",message.headPname);
 
    self.headP.image=[UIImage imageNamed:message.headPname];
    self.titleP.text=message.titleP;
    self.detailP.text=message.detailP;
    if ([message.edgeNum intValue] >0) {
       [self.edgeButton setTitle:message.edgeNum forState:UIControlStateNormal];
        [self.edgeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.edgeButton setBackgroundColor:[UIColor redColor]];
        _edgeButton.layer.cornerRadius=10.f;
    }
    

}
@end
