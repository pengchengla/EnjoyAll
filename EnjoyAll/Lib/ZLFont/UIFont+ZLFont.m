//
//  UIFont+ZLFont.m
//  MaintainPlace
//
//  Created by 王晓冰 on 17/2/17.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "UIFont+ZLFont.h"

#define ZLCycle 0.5

@implementation UIFont (ZLFont)

+ (UIFont *)ZlFontOfSize:(CGFloat) size {

//    CGFloat fitSize = (KScreenHeight/667.0)*size*ZLCycle;
    //宽度计算字体
    CGFloat fitSize = (KScreenWidth/375.0)*size*ZLCycle;
    UIFont *font = [UIFont systemFontOfSize:fitSize];
    return font;
    
//    UIFont *font = [UIFont systemFontOfSize:size];
//    return font;
}

+ (UIFont *)ZlFontOfSize:(CGFloat)size withWeight:(CGFloat)weight {

//    CGFloat fitSize = (KScreenHeight/667.0)*size*ZLCycle;
    //宽度计算字体
    CGFloat fitSize = (KScreenWidth/375.0)*size*ZLCycle;
    UIFont *font = [UIFont systemFontOfSize:fitSize weight:weight];
    return font;
    
//    UIFont *font = [UIFont systemFontOfSize:size weight:weight];
//    return font;
}

@end
