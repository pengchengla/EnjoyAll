//
//  ZLHTTPSessionManager.h
//  MaintainPlace
//
//  Created by 王晓冰 on 17/3/24.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ZLHTTPSessionManager : AFHTTPSessionManager

//增加的单利创建解决循环引用
+ (ZLHTTPSessionManager *)sharedHTTPSession;

@end
