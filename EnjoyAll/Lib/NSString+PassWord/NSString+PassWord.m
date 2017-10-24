//
//  NSString+PassWord.m
//  YJFinance
//
//  Created by 王晓冰 on 2017/9/20.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "NSString+PassWord.h"
#import<CommonCrypto/CommonDigest.h>
#define KSalt @"321-zhang_lei-123" //MD5盐值

@implementation NSString (PassWord)

- (NSString *)phonePassWord {

    NSRange range;
    range.length = 4;
    range.location = 3;
    NSString *closePhoneNumber = [self stringByReplacingCharactersInRange:range withString:@"****"];
    return closePhoneNumber;
}

- (NSString *)cardPassWord {

    if (self.length < 9) {
        return @"";
    }
    
    NSRange range;
    range.length = self.length-8;
    range.location = 4;
    NSMutableString *passString = [[NSMutableString alloc]init];
    for (int i=0; i<range.length; i++) {
        [passString appendString:@"*"];
    }
    
    NSString *closeCardNumber = [self stringByReplacingCharactersInRange:range withString:[passString mutableCopy]];
    return closeCardNumber;
}

- (NSString *)bankPassWord {

    if (self.length < 9) {
        return @"";
    }
    
    NSRange range;
    range.length = self.length-8;
    range.location = 4;
    NSMutableString *passString = [[NSMutableString alloc]init];
    for (int i=0; i<range.length; i++) {
        [passString appendString:@"*"];
    }
    
    NSString *closeCardNumber = [self stringByReplacingCharactersInRange:range withString:[passString mutableCopy]];
    return closeCardNumber;
}

- (NSString *)namePassWord {

    NSRange range;
    range.length = self.length-1;
    range.location = 1;
    
    NSMutableString *passString = [[NSMutableString alloc]init];
    for (int i=0; i<range.length; i++) {
        [passString appendString:@"*"];
    }
    NSString *closeName = [self stringByReplacingCharactersInRange:range withString:[passString mutableCopy]];
    return closeName;
}

- (NSString *)md5PassWord {
    
    NSString *input = [self stringByAppendingString:KSalt];
    
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
