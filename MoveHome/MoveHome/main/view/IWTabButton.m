//
//  IWTabButton.m
//  shuziWeike
//
//  Created by jalin on 15/6/12.
//  Copyright (c) 2015年 shuziqirui. All rights reserved.
//

#import "IWTabButton.h"
#import "UIImage+MJ.h"
#define iwtabbarButtonImageRadio 0.6
@implementation IWTabButton

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];

    if (self) {
        [self setBackgroundImage:  [UIImage imageWithName:@"tabbar_slider"]   forState:UIControlStateSelected];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        self.imageView.contentMode=UIViewContentModeCenter;
    }

    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*iwtabbarButtonImageRadio;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect )titleRectForContentRect:(CGRect)contentRect{
      CGFloat titleY=contentRect.size.height*iwtabbarButtonImageRadio;
     CGFloat titlew=contentRect.size.width;
     CGFloat titleh=contentRect.size.height-titleY;
    
    
    
    return CGRectMake(0, titleY, titlew, titleh);

}
-(void)setItem:(UITabBarItem *)item{
    _item=item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];

}
@end
