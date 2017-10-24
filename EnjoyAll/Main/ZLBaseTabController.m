//
//  ZLBaseTabController.m
//  YHFinance
//
//  Created by 王晓冰 on 2017/9/13.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLBaseTabController.h"
#import "ZLBaseNavController.h"
#import "LocalViewController.h"
#import "FindViewController.h"
#import "AddViewController.h"
#import "MessageViewController.h"
#import "MyViewController.h"

@interface ZLBaseTabController ()<UITabBarControllerDelegate> {
    
    NSMutableArray *_viewCtrlsArray;
}

@end

@implementation ZLBaseTabController
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initCtrls];
    [self initTabbar];
    
    self.tabBar.barStyle = UIBarStyleBlack;
    self.delegate = self;
    
}

- (void)initCtrls {
    
    _viewCtrlsArray = [[NSMutableArray alloc]init];
    
    LocalViewController *localCtrl = [[LocalViewController alloc]init];
    [_viewCtrlsArray addObject:localCtrl];
    
    FindViewController *findCtrl = [[FindViewController alloc]init];
    [_viewCtrlsArray addObject:findCtrl];
    
    AddViewController *addCtrl = [[AddViewController alloc]init];
    [_viewCtrlsArray addObject:addCtrl];
    
    MessageViewController *messageCtrl = [[MessageViewController alloc]init];
    [_viewCtrlsArray addObject:messageCtrl];
    
    MyViewController *myCtrl = [[MyViewController alloc]init];
    [_viewCtrlsArray addObject:myCtrl];
    
    NSMutableArray *navCtrlsArray = [[NSMutableArray alloc]init];
    for (UIViewController *ctrl in _viewCtrlsArray) {
        ZLBaseNavController *navCtrl = [[ZLBaseNavController alloc]initWithRootViewController:ctrl];
        [navCtrlsArray addObject:navCtrl];
    }
    
    self.viewControllers = navCtrlsArray;
}

- (void)initTabbar {
    
    NSArray *titleArray = @[@"本地",@"发现",@"",@"资讯",@"我"];
    NSArray *imageArray = @[@"local.png",@"find.png",@"",@"message.png",@"my.png"];
    NSArray *selectImageArray = @[@"selectLocal.png",@"selectFind.png",@"",@"selectMessage.png",@"selectMy.png"];
    
    for (int i=0; i<self.viewControllers.count; i++) {
        
        //导航控制器
        ZLBaseNavController *navCtrl = self.viewControllers[i];
        
        if (i == 2) {
            //中间按钮
            UIImageView *centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-24)*0.5, (49-24)*0.5, 24, 24)];
            centerImageView.image = [UIImage imageNamed:@"tabbarAdd.png"];
            [self.tabBar addSubview:centerImageView];
            
            continue;
        }
        
        //设置标题
        navCtrl.tabBarItem.title = titleArray[i];
        //设置图片
        navCtrl.tabBarItem.image = [UIImage imageNamed:imageArray[i]];
        //设置选中显示的图片
        navCtrl.tabBarItem.selectedImage = [UIImage imageNamed:selectImageArray[i]];
        
    }
    
    //设置选中后的标题和图片颜色
    // 29 43  137  1
//    self.tabBar.selectedImageTintColor = [UIColor colorWithHexString:@"#222222"];
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#222222"];
    self.tabBar.barTintColor = [UIColor whiteColor];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    for (UIViewController *viewCtrl in viewController.childViewControllers) {
        if ([viewCtrl isKindOfClass:[AddViewController class]]) {
            
            AddViewController *addCtrl = [[AddViewController alloc]init];
            
            //弹出添加视图
            [self presentViewController:[[ZLBaseNavController alloc]initWithRootViewController:addCtrl] animated:NO completion:nil];
            
            return NO;
        }
    }
    
    return YES;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated{
    //加上
    [self.tabBarController.tabBar removeFromSuperview];
}



















@end
