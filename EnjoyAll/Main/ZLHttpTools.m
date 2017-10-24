//
//  ZLHttpTools.m
//  YJFinance
//
//  Created by 王晓冰 on 2017/9/22.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLHttpTools.h"

@implementation ZLHttpTools

//带错误信息的
+ (void)GETWithUrlStr:(NSString *)urlString withParameters:(id)parameters withProgressBlock:(progressBlock )progressBlock withResultBlock:(resultBlock) resultBlock withFailureBlock:(failureBlock) failBlock {
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //申明返回的结果是二进制类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //如果接受类型不一致请替换一致text/html  或者 text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    //请求超时时间设置
    manager.requestSerializer.timeoutInterval = 30;
    
    manager.securityPolicy.allowInvalidCertificates = YES;//忽略https证书
    manager.securityPolicy.validatesDomainName = NO;//是否验证域名
    [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progressBlock) {
            progressBlock(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (resultBlock) {
            
            if ([dict[@"code"] integerValue] == 200) {
                //成功
                resultBlock(dict[@"data"]);
            }else {
                //显示错误信息
                iToast *itoast = [[iToast alloc]initWithText:dict[@"msg"]];
                [itoast show];
                if (failBlock) {
                    failBlock(nil);
                }
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        iToast *itoast = [[iToast alloc]initWithText:@"网络连接失败!"];
        [itoast show];
        if (failBlock) {
            failBlock(error);
        }
        
    }];
}

+ (void)PostWithUrlStr:(NSString *)urlString parameters:(id)parameters withProgressBlock:(progressBlock )progressBlock withResultBlock:(resultBlock)resultBlock withFailure:(failureBlock) failBlock {
    
    //    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    ZLHTTPSessionManager *manager = [ZLHTTPSessionManager sharedHTTPSession];
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //申明返回的结果是二进制类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //如果接受类型不一致请替换一致text/html  或者 text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    //请求超时时间设置
    manager.requestSerializer.timeoutInterval = 30;
    
    manager.securityPolicy.allowInvalidCertificates = YES;//忽略https证书
    manager.securityPolicy.validatesDomainName = NO;//是否验证域名
    
    [manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progressBlock) {
            progressBlock(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (resultBlock) {
            
            if ([dict[@"code"] integerValue] == 200) {
                //成功
                resultBlock(dict[@"data"]);
            }else {
                //显示错误信息
                iToast *itoast = [[iToast alloc]initWithText:dict[@"msg"]];
                [itoast show];
                if (failBlock) {
                    failBlock(nil);
                }
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        iToast *itoast = [[iToast alloc]initWithText:@"网络连接失败!"];
        [itoast show];
        if (failBlock) {
            failBlock(error);
        }
    }];
    
}

+ (void)PostImageWithUrlStr:(NSString *)urlString parameters:(id)parameters withImageBlock:(imageBlock) imageBlock withProgress:(progressBlock )progressBlock withResultBlock:(resultBlock) resultBlock withFailureBlock:(failureBlock) failBlock {
    
    //    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    ZLHTTPSessionManager *manager = [ZLHTTPSessionManager sharedHTTPSession];
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //申明返回的结果是二进制类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //如果接受类型不一致请替换一致text/html  或者 text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    //请求超时时间设置
    manager.requestSerializer.timeoutInterval = 30;
    
    manager.securityPolicy.allowInvalidCertificates = YES;//忽略https证书
    manager.securityPolicy.validatesDomainName = NO;//是否验证域名
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (imageBlock) {
            imageBlock(formData);
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progressBlock) {
            progressBlock(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (resultBlock) {
            
            if ([dict[@"code"] integerValue] == 200) {
                //成功
                resultBlock(dict[@"data"]);
            }else {
                //显示错误信息
                iToast *itoast = [[iToast alloc]initWithText:dict[@"msg"]];
                [itoast show];
                if (failBlock) {
                    failBlock(nil);
                }
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        iToast *itoast = [[iToast alloc]initWithText:@"网络连接失败!"];
        [itoast show];
        if (failBlock) {
            failBlock(error);
        }
    }];
}



//获取网络状态 使用这种方法时一定要保证statusbar没有隐藏。如果你的App隐藏了statusbar，那么你也就不能通过这种方法获得网络状态。
+ (NSString *)networkingStatesFromStatebar {
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    NSString *stateString = @"wifi";
    
    switch (type) {
        case 0:
            stateString = @"notReachable";
            break;
            
        case 1:
            stateString = @"2G";
            break;
            
        case 2:
            stateString = @"3G";
            break;
            
        case 3:
            stateString = @"4G";
            break;
            
        case 4:
            stateString = @"LTE";
            break;
            
        case 5:
            stateString = @"wifi";
            break;
            
        default:
            break;
    }
    
    return stateString;
}

@end
