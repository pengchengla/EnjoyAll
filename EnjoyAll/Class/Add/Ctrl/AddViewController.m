//
//  AddViewController.m
//  EnjoyAll
//
//  Created by 王晓冰 on 2017/10/17.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic,strong)UIImageView *bottomCloseImageView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initSubView];
}

- (void)_initSubView {
    
    UIView *bottomBackView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight-KSHeight(100), KScreenWidth, KSHeight(100))];
    bottomBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomBackView];
    
    _bottomCloseImageView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-KSWidth(36))*0.5, (KSWidth(100)-KSHeight(36))*0.5, KSWidth(36), KSHeight(36))];
    _bottomCloseImageView.image = [UIImage imageNamed:@"addClose.png"];
    [bottomBackView addSubview:_bottomCloseImageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
