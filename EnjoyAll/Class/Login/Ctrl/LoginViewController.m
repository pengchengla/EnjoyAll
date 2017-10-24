//
//  LoginViewController.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/19.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "LoginViewController.h"
#import "ZLLeftImageTextField.h"
#import "ZLTextButton.h"
#import "ZLHeadButton.h"
#import "ZLBaseTabController.h"
#import "VerifyPhoneViewController.h"
#import "LTCodeButton.h"
#import "RSKImageCropper.h"

@interface LoginViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,RSKImageCropViewControllerDelegate>

@property (nonatomic,strong)ZLHeadButton *headImageButton;
@property (nonatomic,strong)UIButton *registerButton;
@property (nonatomic,strong)UIButton *loginButton;
@property (nonatomic,strong)UIImageView *buttonBottomImageView;
@property (nonatomic,strong)ZLLeftImageTextField *phoneTextField;
@property (nonatomic,strong)ZLLeftImageTextField *codeTextField;
@property (nonatomic,strong)ZLLeftImageTextField *passWordField;
@property (nonatomic,strong)ZLLeftImageTextField *surePassWordField;
@property (nonatomic,assign)NSInteger type;//1注册 2登录
@property (nonatomic,strong)ZLTextButton *forgetButton;
@property (nonatomic,strong)ZLTextButton *goRegisterButton;
@property (nonatomic,strong)UILabel *otherLabel;
@property (nonatomic,strong)UIView *leftLineView;
@property (nonatomic,strong)UIView *rightLineView;
@property (nonatomic,strong)UIButton *bottomRegisterButton;
@property (nonatomic,strong)UIButton *bottomLoginButton;
@property (nonatomic,strong)NSMutableArray *otherButtonArray;
@property (nonatomic,strong)LTCodeButton *codeButton;
@property (nonatomic,strong)ZLTextButton *serviceButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initSubView];
}

- (void)_initSubView {
    
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:KScreenBounds];
    backImageView.image = [UIImage imageNamed:@"loginBg.png"];
    [self.view addSubview:backImageView];
    
    _headImageButton = [[ZLHeadButton alloc]initWithFrame:CGRectMake(KSWidth(213), KSHeight(109), KScreenWidth-KSWidth(213)*2, KScreenWidth-KSWidth(213)*2)];
    [_headImageButton addTarget:self action:@selector(headImageButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_headImageButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(KSWidth(60), _headImageButton.bottom+KSHeight(5), KSWidth(45.5)+KSWidth(100)*2, KSHeight(36)+KSHeight(18)*2);
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:KColor(255, 255, 255) forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont ZlFontOfSize:36];
    [_registerButton addTarget:self action:@selector(registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(KScreenWidth-_registerButton.left-_registerButton.width, _registerButton.top, _registerButton.width, _registerButton.height);
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:KColor(255, 255, 255) forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont ZlFontOfSize:36];
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
 
    _buttonBottomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_loginButton.left+(_loginButton.width-KSWidth(32))*0.5, _registerButton.bottom, KSWidth(32), KSHeight(16))];
    _buttonBottomImageView.image = [UIImage imageNamed:@"buttonBottom.png"];
    [self.view addSubview:_buttonBottomImageView];
    
    _phoneTextField = [[ZLLeftImageTextField alloc]initWithFrame:CGRectMake((KScreenWidth-KSWidth(586))*0.5, _buttonBottomImageView.bottom+KSHeight(43), KSWidth(586), KSHeight(86))];
    _phoneTextField.placeText = @"输入手机号";
    _phoneTextField.textMaxLength = 11;
    _phoneTextField.leftImageView.image = [UIImage imageNamed:@"phone.png"];
    [self.view addSubview:_phoneTextField];
    
    _passWordField = [[ZLLeftImageTextField alloc]initWithFrame:CGRectMake(_phoneTextField.left, _phoneTextField.bottom, _phoneTextField.width, _phoneTextField.height)];
    _passWordField.placeText = @"输入密码";
    _passWordField.leftImageView.image = [UIImage imageNamed:@"passWord.png"];
    _passWordField.textMaxLength = KPassWordLength;
    [self.view addSubview:_passWordField];
    
    _bottomLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _bottomLoginButton.frame = CGRectMake((KScreenWidth-KSWidth(580))*0.5, _passWordField.bottom+KSHeight(56), KSWidth(580), KSHeight(80));
    [_bottomLoginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_bottomLoginButton setBackgroundImage:[UIImage imageNamed:@"codeBack.png"] forState:UIControlStateNormal];
    _bottomLoginButton.titleLabel.font = [UIFont ZlFontOfSize:32];
    [_bottomLoginButton addTarget:self action:@selector(bottomLoginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_bottomLoginButton];
    
    _forgetButton = [[ZLTextButton alloc]initWithFrame:CGRectMake(_bottomLoginButton.left, _bottomLoginButton.bottom, _bottomLoginButton.width*0.5, KSHeight(28)+KSHeight(34)*2)];
    _forgetButton.textLabel.text = @"忘记密码?";
    _forgetButton.textLabel.textAlignment = NSTextAlignmentLeft;
    [_forgetButton addTarget:self action:@selector(forgetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetButton];
    
    _goRegisterButton = [[ZLTextButton alloc]initWithFrame:CGRectMake(_forgetButton.right, _forgetButton.top, _forgetButton.width, _forgetButton.height)];
    _goRegisterButton.textLabel.text = @"没有账号,去注册!";
    _goRegisterButton.textLabel.textAlignment = NSTextAlignmentRight;
    [_goRegisterButton addTarget:self action:@selector(goRegisterButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_goRegisterButton];
    
    _leftLineView = [[UIView alloc]initWithFrame:CGRectMake(0, _bottomLoginButton.bottom+KSHeight(126)+(KSHeight(24)-KLineHeight)*0.5, (KScreenWidth-KSWidth(240))*0.5, KLineHeight)];
    _leftLineView.backgroundColor = KLineColor;
    [self.view addSubview:_leftLineView];
    
    _otherLabel = [[UILabel alloc]initWithFrame:CGRectMake(_leftLineView.right, _bottomLoginButton.bottom+KSHeight(126), KSWidth(240), KSHeight(24))];
    _otherLabel.textColor = KColor(255, 255, 255);
    _otherLabel.font = [UIFont ZlFontOfSize:24];
    _otherLabel.text = @"使用第三方账号登录";
    _otherLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_otherLabel];
    
    _rightLineView = [[UIView alloc]initWithFrame:CGRectMake(_otherLabel.right, _leftLineView.top, _leftLineView.width, _leftLineView.height)];
    _rightLineView.backgroundColor = KLineColor;
    [self.view addSubview:_rightLineView];
    
    NSArray *imageArray = @[@"QQ.png",@"WX.png",@"WB.png"];
    _otherButtonArray = [[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(KSWidth(185)+i*(KSWidth(40)+KSWidth(100)), _otherLabel.bottom+KSHeight(50), KSWidth(100), KSHeight(100));
        button.tag = i;
        [button setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [_otherButtonArray addObject:button];
        
    }
}

- (void)headImageButtonAction {
    
//    _headImageButton.showImageView.image = [UIImage imageNamed:@"WX.png"];
    
    if (_type == 1) {
        //注册的时候可点击
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"上传头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerController.delegate = self;
//            pickerController.allowsEditing = YES; // 设置选择后的图片是否能被编辑
            [self presentViewController:pickerController animated:YES completion:nil];
        }];
        [alertCtrl addAction:photoAction];
        
        UIAlertAction *pickerAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            // 判断是否有相机
            if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                picker.sourceType = sourceType; // 资源类型为照相机
//                picker.allowsEditing = YES;     // 设置选择后的图片是否能被编辑
                [self presentViewController:picker animated:YES completion:nil];
            }else {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"该设备无摄像头"delegate:self cancelButtonTitle:@"取消"otherButtonTitles: nil];
                [alertView show];
            }
        }];
        [alertCtrl addAction:pickerAction];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertCtrl addAction:cancelAction];
        [self presentViewController:alertCtrl animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // 当选择的类型是图片
    if (image)
    {
//        UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"]; // 裁剪后的图片
        RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:image];
        imageCropVC.delegate = self;
        [self.navigationController pushViewController:imageCropVC animated:YES];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}  

- (void)registerButtonAction {
    _type = 1;
    [self changeType];
    
}

- (void)loginButtonAction {
    _type = 2;
    [self changeType];
}

- (void)forgetButtonAction {
    VerifyPhoneViewController *veriftyCtrl = [[VerifyPhoneViewController alloc]init];
    [self.navigationController pushViewController:veriftyCtrl animated:YES];
}

- (void)goRegisterButtonAction {
    _type = 1;
    [self changeType];
}

//登录
- (void)bottomLoginButtonAction {
    [UIApplication sharedApplication].keyWindow.rootViewController = [[ZLBaseTabController alloc]init];
}

- (void)otherButtonAction:(UIButton *)button {
    switch (button.tag) {
        case 0:
            //QQ
            break;
        case 1:
            //微信
            break;
        case 2:
            //微博
            break;
        default:
            break;
    }
}

#pragma mark - 注册
- (ZLLeftImageTextField *)codeTextField {
    if (_codeTextField == nil) {
        _codeTextField = [[ZLLeftImageTextField alloc]initWithFrame:CGRectMake((KScreenWidth-KSWidth(586))*0.5, _buttonBottomImageView.bottom+KSHeight(43), KSWidth(586), KSHeight(86))];
        _codeTextField.placeText = @"输入验证码";
        _codeTextField.leftImageView.image = [UIImage imageNamed:@"code.png"];
        _codeTextField.textMaxLength = 6;
        [self.view addSubview:_codeTextField];
    }
    return _codeTextField;
}

- (ZLLeftImageTextField *)surePassWordField {
    if (_surePassWordField == nil) {
        _surePassWordField = [[ZLLeftImageTextField alloc]initWithFrame:CGRectMake((KScreenWidth-KSWidth(586))*0.5, _buttonBottomImageView.bottom+KSHeight(43), KSWidth(586), KSHeight(86))];
        _surePassWordField.placeText = @"确认密码";
        _surePassWordField.leftImageView.image = [UIImage imageNamed:@"passWord.png"];
        _surePassWordField.textMaxLength = KPassWordLength;
        [self.view addSubview:_surePassWordField];
    }
    return _surePassWordField;
}

- (LTCodeButton *)codeButton {
    if (_codeButton == nil) {
        _codeButton = [LTCodeButton buttonWithType:UIButtonTypeCustom];
        _codeButton.frame = CGRectMake(0, 0, KSWidth(160), KSHeight(54));
        _codeButton.backgroundColor = [UIColor redColor];
        [_codeButton addTarget:self action:@selector(codeButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_codeTextField addSubview:_codeButton];
    }
    return _codeButton;
}

- (void)codeButtonAction {
    _codeButton.isPhoneNumber = YES;
}

- (ZLTextButton *)serviceButton {
    if (_serviceButton == nil) {
        _serviceButton = [[ZLTextButton alloc]initWithFrame:CGRectMake(_phoneTextField.left, 0, _phoneTextField.width, KSHeight(110))];
        _serviceButton.textLabel.text = @"《服务协议》点击注册则代表服务条款";
        _serviceButton.textLabel.textAlignment = NSTextAlignmentLeft;
        _serviceButton.textLabel.font = [UIFont ZlFontOfSize:30];
        [_serviceButton addTarget:self action:@selector(serviceButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_serviceButton];
        
    }
    return _serviceButton;
}

- (void)serviceButtonAction {
    
    
}

- (UIButton *)bottomRegisterButton {
    
    if (_bottomRegisterButton == nil) {
        _bottomRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomRegisterButton.frame = CGRectMake((KScreenWidth-KSWidth(580))*0.5, _passWordField.bottom+KSHeight(56), KSWidth(580), KSHeight(80));
        [_bottomRegisterButton setTitle:@"注册" forState:UIControlStateNormal];
        [_bottomRegisterButton setBackgroundImage:[UIImage imageNamed:@"codeBack.png"] forState:UIControlStateNormal];
        _bottomRegisterButton.titleLabel.font = [UIFont ZlFontOfSize:32];
        [_bottomRegisterButton addTarget:self action:@selector(bottomRegisterButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomRegisterButton];
    }
    return _bottomRegisterButton;
}

- (void)bottomRegisterButtonAction {
    
}

#pragma mark - typeAction
- (void)changeType {
    
    if (_type == 1) {
        //注册显示
        _buttonBottomImageView.left = _registerButton.left+(_loginButton.width-KSWidth(32))*0.5;
        self.codeTextField.top = _phoneTextField.bottom;
        self.codeTextField.hidden = NO;
        self.codeButton.left = self.codeTextField.width-self.codeButton.width;
        self.codeButton.top = (self.codeTextField.height-self.codeButton.height)*0.5;
        _passWordField.top = self.codeTextField.bottom;
        self.surePassWordField.top = _passWordField.bottom;
        self.surePassWordField.hidden = NO;
        self.serviceButton.top = self.surePassWordField.bottom+KSHeight(20);
        self.serviceButton.hidden = NO;
        self.bottomRegisterButton.top = self.serviceButton.bottom;
        self.bottomRegisterButton.hidden = NO;
        
        //登录隐藏
        _bottomLoginButton.hidden = YES;
        _forgetButton.hidden = YES;
        _goRegisterButton.hidden = YES;
        _leftLineView.hidden = YES;
        _otherLabel.hidden = YES;
        _rightLineView.hidden = YES;
        for (int i=0; i<_otherButtonArray.count; i++) {
            UIButton *button = _otherButtonArray[i];
            button.hidden = YES;
        }
    }else if (_type == 2) {
        //登录显示
        _buttonBottomImageView.left = _loginButton.left+(_loginButton.width-KSWidth(32))*0.5;
        _passWordField.top = _phoneTextField.bottom;
        _bottomLoginButton.hidden = NO;
        _forgetButton.hidden = NO;
        _goRegisterButton.hidden = NO;
        _leftLineView.hidden = NO;
        _otherLabel.hidden = NO;
        _rightLineView.hidden = NO;
        for (int i=0; i<_otherButtonArray.count; i++) {
            UIButton *button = _otherButtonArray[i];
            button.hidden = NO;
        }
        
        //隐藏注册的
        self.codeTextField.hidden = YES;
        self.surePassWordField.hidden = YES;
        self.serviceButton.hidden = YES;
        self.bottomRegisterButton.hidden = YES;
        
    }
}

#pragma mark - 裁剪图片
#pragma mark - RSKImageCropViewControllerDelegate

- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage
{
//    [self.addPhotoButton setImage:croppedImage forState:UIControlStateNormal];
    _headImageButton.showImageView.image = croppedImage;
    [self.navigationController popViewControllerAnimated:YES];
}





@end
