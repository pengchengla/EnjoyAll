//
//  UIColor+Hex.h
//  PropertyManager
//
//  Created by wxy on 16/5/10.
//  Copyright © 2016年 wuxianying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

+ (UIColor *) colorWithHexString: (NSString *)color;

@end
