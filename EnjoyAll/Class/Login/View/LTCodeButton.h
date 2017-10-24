//
//  LTCodeButton.h
//  23424243
//
//  Created by cxwl on 16/8/27.
//  Copyright © 2016年 cxwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCodeButton : UIButton

@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic,assign)BOOL isPhoneNumber;

- (void)stop;

@end
