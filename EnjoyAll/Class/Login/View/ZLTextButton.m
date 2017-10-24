//
//  ZLTextButton.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/19.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLTextButton.h"

@implementation ZLTextButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubView];
    }
    return self;
}

- (void)_initSubView {
    _textLabel = [[UILabel alloc]initWithFrame:self.bounds];
    _textLabel.font = [UIFont ZlFontOfSize:28];
    _textLabel.textColor = KColor(255, 255, 255);
    [self addSubview:_textLabel];
}








@end
