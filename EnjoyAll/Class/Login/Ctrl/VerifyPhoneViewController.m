//
//  VerifyPhoneViewController.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/20.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "VerifyPhoneViewController.h"
#import "LTCodeButton.h"
#import "ForgetPassWordViewController.h"

@interface VerifyPhoneViewController ()<UITextFieldDelegate>

@property (nonatomic,copy)UITextField *phoneTextField;

@property (nonatomic,strong)UITextField *numberCodeTextField;

@property (nonatomic,strong)UITextField *imageCodeTextField;

@property (nonatomic,strong)LTCodeButton *numberCodeButton;

@property (nonatomic,strong)UIButton *imageCodeButton;


@end

@implementation VerifyPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    [self _initSubView];
}

- (void)_initSubView {
    
    NSDictionary *holderDic = @{
                               NSFontAttributeName:[UIFont ZlFontOfSize:26],
                               NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#5f5f5f"]
                               };
    
    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(KSWidth(20), 0, KScreenWidth-KSWidth(20)*2, KSHeight(86))];
    _phoneTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入手机号" attributes:holderDic];
    _phoneTextField.textColor = [UIColor colorWithHexString:@"#5f5f5f"];
    _phoneTextField.font = [UIFont ZlFontOfSize:26];
    _phoneTextField.delegate = self;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_phoneTextField];
    
    UIView *phoneLineView = [[UIView alloc]initWithFrame:CGRectMake(_phoneTextField.left, _phoneTextField.bottom, _phoneTextField.width, KLineHeight)];
    phoneLineView.backgroundColor = [UIColor colorWithHexString:@"#c6c6c6"];
    [self.view addSubview:phoneLineView];
    
    _numberCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(_phoneTextField.left, phoneLineView.bottom, _phoneTextField.width, _phoneTextField.height)];
    _numberCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入验证码" attributes:holderDic];
    _numberCodeTextField.textColor = [UIColor colorWithHexString:@"#5f5f5f"];
    _numberCodeTextField.font = [UIFont ZlFontOfSize:26];
    _numberCodeTextField.delegate = self;
    [self.view addSubview:_numberCodeTextField];
    
    _numberCodeButton = [LTCodeButton buttonWithType:UIButtonTypeCustom];
    _numberCodeButton.frame = CGRectMake(_numberCodeTextField.width-KSWidth(160), (_numberCodeTextField.height-KSHeight(52))*0.5, KSWidth(160), KSHeight(52));
    [_numberCodeButton addTarget:self action:@selector(numberCodeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_numberCodeTextField addSubview:_numberCodeButton];
    
    UIView *numberCodeLineView = [[UIView alloc]initWithFrame:CGRectMake(_phoneTextField.left, _numberCodeTextField.bottom, _phoneTextField.width, KLineHeight)];
    numberCodeLineView.backgroundColor = [UIColor colorWithHexString:@"#c6c6c6"];
    [self.view addSubview:numberCodeLineView];
    
    _imageCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(KSWidth(20), numberCodeLineView.bottom, KScreenWidth-KSWidth(20)*2, KSHeight(86))];
    _imageCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入验证码" attributes:holderDic];
    _imageCodeTextField.textColor = [UIColor colorWithHexString:@"#5f5f5f"];
    _imageCodeTextField.font = [UIFont ZlFontOfSize:26];
    _imageCodeTextField.delegate = self;
    [self.view addSubview:_imageCodeTextField];
    
    _imageCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageCodeButton.frame = CGRectMake(_imageCodeTextField.width-KSWidth(110), (_imageCodeTextField.height-KSHeight(40))*0.5, KSWidth(110), KSHeight(40));
    [_imageCodeButton addTarget:self action:@selector(imageCodeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _imageCodeButton.backgroundColor = [UIColor lightGrayColor];
    [_imageCodeTextField addSubview:_imageCodeButton];
    
    UIView *imageCodeLineView = [[UIView alloc]initWithFrame:CGRectMake(_phoneTextField.left, _imageCodeTextField.bottom, _phoneTextField.width, KLineHeight)];
    imageCodeLineView.backgroundColor = [UIColor colorWithHexString:@"#c6c6c6"];
    [self.view addSubview:imageCodeLineView];
    
    ZLNextButton *nextButton = [ZLNextButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake((KScreenWidth-KSWidth(510))*0.5, imageCodeLineView.bottom+KSHeight(50), KSWidth(510), KSHeight(78));
    [nextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:nextButton];
    
//    nextButton.backgroundColor = [UIColor redColor];
}

- (void)numberCodeButtonAction {
    _numberCodeButton.isPhoneNumber = YES;
}

- (void)imageCodeButtonAction {
    
}

- (void)nextButtonAction {
    ForgetPassWordViewController *forgetCtrl = [[ForgetPassWordViewController alloc]init];
    [self.navigationController pushViewController:forgetCtrl animated:YES];
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
    
    if (textField == _phoneTextField) {
        
        if (text.length > KPhoneLength) {
            return NO;
        }
        
        return [ZLUseTools validateNumber:string];
    }else if (textField == _numberCodeTextField) {
        if (text.length > KCodeLength) {
            return NO;
        }
        return [ZLUseTools validateNumber:string];
    }
    
    return YES;
}




@end
