//
//  ZLBaseViewController.m
//  YHFinance
//
//  Created by 王晓冰 on 2017/9/13.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLBaseViewController.h"

@interface ZLBaseViewController ()

@end

@implementation ZLBaseViewController
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController setNavigationBarHidden:NO];
    
    if (self.navigationController.viewControllers.count > 1) {
        //在二级以上界面才添加系统的返回手势
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        //返回按钮
        [self _initBackButton];
        
        //显示导航栏
        [self.navigationController setNavigationBarHidden:NO];
    }else {
        
        //隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    
}

- (void)_initBackButton {

    UIControl *backCtrl = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, KSWidth(19)+KSWidth(20)+KSWidth(54)+KSWidth(20), KSHeight(34))];
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KSWidth(19), KSHeight(34))];
    backImageView.image = [UIImage imageNamed:@"back.png"];
    [backCtrl addSubview:backImageView];
    
//    UILabel *backLabel = [[UILabel alloc]initWithFrame:CGRectMake(backImageView.right, 0, backCtrl.width-backImageView.width, backCtrl.height)];
//    backLabel.font = [UIFont ZlFontOfSize:30];
//    backLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//    backLabel.text = @"返回";
//    backLabel.textAlignment = NSTextAlignmentCenter;
//    [backCtrl addSubview:backLabel];
    
    [backCtrl addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backCtrl];
}

- (void)backButtonAction {
        
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


//结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (void)dealloc
{
//    NSLog(@"销毁ZLBase的---------------子类");
}








@end
