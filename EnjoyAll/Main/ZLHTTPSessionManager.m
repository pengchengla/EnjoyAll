//
//  ZLHTTPSessionManager.m
//  MaintainPlace
//
//  Created by 王晓冰 on 17/3/24.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLHTTPSessionManager.h"

@implementation ZLHTTPSessionManager

+ (ZLHTTPSessionManager *)sharedHTTPSession{
    
    static ZLHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [ZLHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30;
        [manager.requestSerializer  setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    });
    return manager;
}

@end
