//
//  NSString+PassWord.h
//  YJFinance
//
//  Created by 王晓冰 on 2017/9/20.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PassWord)

- (NSString *)phonePassWord;

- (NSString *)cardPassWord;

- (NSString *)bankPassWord;

- (NSString *)namePassWord;

- (NSString *)md5PassWord;

@end
