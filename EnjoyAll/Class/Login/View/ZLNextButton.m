//
//  ZLNextButton.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/20.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLNextButton.h"

@implementation ZLNextButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubView];
    }
    return self;
}

- (void)_initSubView {

    self.backgroundColor = [UIColor colorWithHexString:@"#ff9b26"];
    self.titleLabel.font = [UIFont ZlFontOfSize:38];

}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.layer.cornerRadius = frame.size.height*0.5;
    self.layer.masksToBounds = YES;
}




@end
