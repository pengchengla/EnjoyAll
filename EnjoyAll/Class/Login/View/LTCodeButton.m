//
//  LTCodeButton.m
//  23424243
//
//  Created by cxwl on 16/8/27.
//  Copyright © 2016年 cxwl. All rights reserved.
//

#import "LTCodeButton.h"


@interface LTCodeButton ()

@end

@implementation LTCodeButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _initSubView];
    }
    return self;
}

- (void)_initSubView {

    [self setBackgroundImage:[UIImage imageNamed:@"codeBack.png"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"codeBack.png"] forState:UIControlStateDisabled];
    //设置字体大小
    self.titleLabel.font = [UIFont ZlFontOfSize:28];
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    
    // 01 记录当前按下时间
    NSTimeInterval upTime = [[[NSUserDefaults standardUserDefaults] objectForKey:@"kCodeTime"] doubleValue];
    // 02 获取当前系统时间做为比较
    NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
    if (nowTime - upTime <= 60) {
        // 当前在加载状态
//        self.backgroundColor = [UIColor colorWithHexString:@"#abd3c1"];
        self.enabled = NO;
        //设置显示的文字
        [self setTitle:[NSString stringWithFormat:@"%ds",60 - (int)(nowTime - upTime)] forState:UIControlStateNormal];
//         2.设置倒计时效果
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 创建定时器
            _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAtcion:) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] run];
        });
        
    }
}

- (void)setIsPhoneNumber:(BOOL)isPhoneNumber {

    _isPhoneNumber = isPhoneNumber;
    
    if (_isPhoneNumber) {
        //是手机号
        [self startTimer];
    }
}

- (void)startTimer {

    //改变背景色237, 237, 237
//    self.backgroundColor = [UIColor colorWithHexString:@"#abd3c1"];
    
    // 开始执行加载状态
    // 1.获取当前按下时间
    NSTimeInterval upTime = [[[NSUserDefaults standardUserDefaults] objectForKey:@"kCodeTime"] doubleValue];
    
    // 3.获取当前系统时间
    NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
    if (nowTime - upTime > 60 && _isPhoneNumber == YES) {
        
        //设置标题
        [self setTitle:@"60s" forState:UIControlStateNormal];
        // 记录当前按钮点击的时间
        [[NSUserDefaults standardUserDefaults] setObject:@(nowTime) forKey:@"kCodeTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // 当前视图设置为禁用状态
        self.enabled = NO;
        // 开启到计时效果
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 创建定时器
            _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAtcion:) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] run];
        });
    }

}

#pragma mark - 定时器调用事件
- (void)timerAtcion:(NSTimer *)timer
{
    // 回到主线程设置任务
    dispatch_async(dispatch_get_main_queue(), ^{
        // 1.获取按下时间
        NSTimeInterval upTime = [[[NSUserDefaults standardUserDefaults] objectForKey:@"kCodeTime"] doubleValue];
        // 02 获取当前系统时间做为比较
        NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
        if (nowTime - upTime <= 60) {
            
            //设置显示的文字
            [self setTitle:[NSString stringWithFormat:@"%ds",60 - (int)(nowTime - upTime)] forState:UIControlStateNormal];
        } else {
            // 停止定时器
            [_timer invalidate];
            _timer = nil;

            // 视图恢复点击状态
            self.enabled = YES;
            
            //改变当前颜色
//            self.backgroundColor = [UIColor colorWithHexString:@"#79bd8f"];
            //改变标题
            [self setTitle:@"重新发送" forState:UIControlStateNormal];
        }
    });
}

- (void)stop {

    [_timer invalidate];
    _timer = nil;
    //销毁定时器,删除本地储存的时间
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"kCodeTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 视图恢复点击状态
    self.enabled = YES;
    
    //改变当前颜色
//    self.backgroundColor = [UIColor colorWithHexString:@"#79bd8f"];
    //改变标题
    [self setTitle:@"重新发送" forState:UIControlStateNormal];
    
}








@end
