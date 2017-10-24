//
//  ForgetPassWordViewController.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/20.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ForgetPassWordViewController.h"

@interface ForgetPassWordViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)UITextField *passWordTextField;
@property (nonatomic,strong)UITextField *surePassWordTextField;

@end

@implementation ForgetPassWordViewController

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
    
    _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(KSWidth(20), 0, KScreenWidth-KSWidth(20)*2, KSHeight(86))];
    _passWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"输入新密码" attributes:holderDic];
    _passWordTextField.textColor = [UIColor colorWithHexString:@"#5f5f5f"];
    _passWordTextField.font = [UIFont ZlFontOfSize:26];
    _passWordTextField.delegate = self;
    [self.view addSubview:_passWordTextField];
    
    UIView *passWordLineView = [[UIView alloc]initWithFrame:CGRectMake(_passWordTextField.left, _passWordTextField.bottom, _passWordTextField.width, KLineHeight)];
    passWordLineView.backgroundColor = [UIColor colorWithHexString:@"#c6c6c6"];
    [self.view addSubview:passWordLineView];
    
    _surePassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(KSWidth(20), _passWordTextField.bottom, KScreenWidth-KSWidth(20)*2, KSHeight(86))];
    _surePassWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"确认密码" attributes:holderDic];
    _surePassWordTextField.textColor = [UIColor colorWithHexString:@"#5f5f5f"];
    _surePassWordTextField.font = [UIFont ZlFontOfSize:26];
    _surePassWordTextField.delegate = self;
    [self.view addSubview:_surePassWordTextField];
    
    UIView *surePassWordLineView = [[UIView alloc]initWithFrame:CGRectMake(_passWordTextField.left, _surePassWordTextField.bottom, _passWordTextField.width, KLineHeight)];
    surePassWordLineView.backgroundColor = [UIColor colorWithHexString:@"#c6c6c6"];
    [self.view addSubview:surePassWordLineView];
    
    ZLNextButton *sureButton = [ZLNextButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake((KScreenWidth-KSWidth(510))*0.5, surePassWordLineView.bottom+KSHeight(50), KSWidth(510), KSHeight(78));
    [sureButton setTitle:@"完成" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureButton];

}

- (void)sureButtonAction {
    
    iToast *itoast = [[iToast alloc]initWithText:@"找回密码成功"];
    [itoast show];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
    
    if (text.length > KCodeLength) {
        return NO;
    }
    
    return YES;
}









@end
