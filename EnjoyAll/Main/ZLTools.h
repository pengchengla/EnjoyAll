//
//  ZLTools.h
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/17.
//  Copyright © 2017年 张雷. All rights reserved.
//

#ifndef ZLTools_h
#define ZLTools_h

#define KNavHeight 64
#define KTabbarHeight 49
#define KScreenBounds  [UIScreen mainScreen].bounds
#define KScreenWidth   [UIScreen mainScreen].bounds.size.width
#define KScreenHeight  [UIScreen mainScreen].bounds.size.height
//#define KScreenHeight  ([UIScreen mainScreen].bounds.size.height-34-24)
#define KSWidth(width) (KScreenWidth*1.0/750.0*(width))
#define KSHeight(height) (KScreenHeight*1.0/1334.0*(height))
//#define KSHeight(height) (KScreenWidth*1.0/750.0*(height))
#define KUserDefaults [NSUserDefaults standardUserDefaults]
#define KWeakSelf(type) __weak typeof(type) weak##type = type;
#define KStrongSelf(type) __strong typeof(type)strong##type = weak##type
#define KColor(a,b,c)  [UIColor colorWithRed:a green:b blue:c alpha:1]
#define KLineHeight KSHeight(2)  //线高
#define KLineColor  [UIColor colorWithHexString:@"#dfdfdf"] //线颜色
#define KPassWordLength 16 //密码最大长度
#define KPhoneLength 11 //手机号长度
#define KCodeLength 6 //验证码长度


#endif /* ZLTools_h */
