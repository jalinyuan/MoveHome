//
//  CLTreeViewOneCell.m
//  shuziWeike
//
//  Created by jalin on 15/6/26.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "CLTreeViewOneCell.h"


@implementation CLTreeViewOneCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)drawRect:(CGRect)rect
//{
//    int addX = _node.nodeLevel*25; //根据节点所在的层次计算平移距离
//    CGRect titleFrame = _titleText.frame;
//    titleFrame.origin.x = 14 + addX;
//    _titleText.frame = titleFrame;
//    
//    CGRect nameFrame = _name.frame;
//    nameFrame.origin.x = 62 + addX;
//    _name.frame = nameFrame;
//}

- (IBAction)editAction:(UIButton *)sender {
  
    [self.delegate clickButton:sender.tag withTitle:self.titleText.text];
}
@end
