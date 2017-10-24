//
//  ZLHttpTools.h
//  YJFinance
//
//  Created by 王晓冰 on 2017/9/22.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLHTTPSessionManager.h"

//图片的
typedef void(^imageBlock)(id<AFMultipartFormData> formData);

//结果
typedef void(^resultBlock)(id result);
//进度
typedef void(^progressBlock)(NSProgress *downloadProgress);

//网络连接失败
typedef void(^failureBlock)(NSError *error);

@interface ZLHttpTools : NSObject

+ (void)GETWithUrlStr:(NSString *)urlString withParameters:(id)parameters withProgressBlock:(progressBlock )progressBlock withResultBlock:(resultBlock) resultBlock withFailureBlock:(failureBlock) failBlock;

+ (void)PostWithUrlStr:(NSString *)urlString parameters:(id)parameters withProgressBlock:(progressBlock )progressBlock withResultBlock:(resultBlock)resultBlock withFailure:(failureBlock) failBlock;

+ (void)PostImageWithUrlStr:(NSString *)urlString parameters:(id)parameters withImageBlock:(imageBlock) imageBlock withProgress:(progressBlock )progressBlock withResultBlock:(resultBlock) resultBlock withFailureBlock:(failureBlock) failBlock;


//获取网络状态
+ (NSString *)networkingStatesFromStatebar;

@end
