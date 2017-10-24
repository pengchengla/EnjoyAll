//
//  ZLLeftImageTextField.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/19.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLLeftImageTextField.h"

@implementation ZLLeftImageTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubView];
    }
    return self;
}

- (void)_initSubView {
    
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (self.height-KSHeight(47))*0.5, KSWidth(36), KSHeight(47))];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_leftImageView];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(_leftImageView.right+KSWidth(26), 0, self.width-_leftImageView.width-KSWidth(26), self.height)];
    _textField.font = [UIFont ZlFontOfSize:28];
    _textField.textColor = KColor(255, 255, 255);
    _textField.delegate = self;
    [self addSubview:_textField];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-KLineHeight, self.width, KLineHeight)];
    lineView.backgroundColor = KLineColor;
    [self addSubview:lineView];
}

- (void)setPlaceText:(NSString *)placeText {
    _placeText = placeText;
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName:KColor(255, 255, 255),
                          NSFontAttributeName:[UIFont ZlFontOfSize:28]
                          };
    _textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:_placeText attributes:dic];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString *text = [[NSMutableString alloc]initWithString:textField.text];
    
    if (range.length == 0) {
        //添加
        [text insertString:string atIndex:range.location];
    }else {
        //删除
        [text deleteCharactersInRange:range];
    }
    
    if (!_isPassWord) {
        //不是密码限制输入
        return [ZLUseTools validateNumber:string];
    }
    
    if (_textMaxLength > 0) {
        //限制输入长度
        if (text.length > _textMaxLength) {
            return NO;
        }
    }
    
    return YES;
}



@end
