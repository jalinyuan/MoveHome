//
//  CLTreeVIewTwoCell.m
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "CLTreeVIewTwoCell.h"

@implementation CLTreeVIewTwoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editAction:(UIButton *)sender {

    [self.delegate clickButtonTwo:sender.tag withTitle:self.TitleText.text];
    
}
@end
