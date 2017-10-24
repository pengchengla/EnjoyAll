//
//  ZLLeftImageTextField.h
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/19.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLLeftImageTextField : UIView <UITextFieldDelegate>

@property (nonatomic,strong)UIImageView *leftImageView;
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,copy)NSString *placeText;
@property (nonatomic,assign)NSUInteger textMaxLength;
@property (nonatomic,assign)BOOL isPassWord;

@end
