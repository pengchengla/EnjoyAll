//
//  ZLHeadButton.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/19.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLHeadButton.h"

@implementation ZLHeadButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubView];
    }
    return self;
}

- (void)_initSubView {
    
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headBack.png"]];
    backImageView.frame = self.bounds;
    [self addSubview:backImageView];
    
    CGFloat headWhiteWidth = 0;
    CGFloat headWhiteHeight = 0;
    
    CGFloat showWidth = self.width-KSWidth(26)-headWhiteWidth;
    CGFloat showHeight = self.height-KSHeight(26)-headWhiteHeight;
    _showImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width-showWidth)*0.5, (self.height-showHeight)*0.5, showWidth, showHeight)];
    _showImageView.layer.masksToBounds = YES;
    _showImageView.layer.cornerRadius = _showImageView.height*0.5;
    [self addSubview:_showImageView];
    
    
}







@end
