//
//  CLTreeViewThreeeCell.m
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "CLTreeViewThreeeCell.h"

@implementation CLTreeViewThreeeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editAction:(UIButton *)sender {
    [self.delegate clickButtonThree:sender.tag withTitle:self.textLabel.text];
}
@end
