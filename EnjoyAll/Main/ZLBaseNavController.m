//
//  ZLBaseNavController.m
//  YHFinance
//
//  Created by 王晓冰 on 2017/9/13.
//  Copyright © 2017年 张雷. All rights reserved.
//

#import "ZLBaseNavController.h"

@interface ZLBaseNavController ()

@end

@implementation ZLBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置不穿透
    self.navigationBar.translucent = NO;
    
    //设置导航栏字体 232, 158, 121
    NSDictionary *titleDic = @{
                               NSForegroundColorAttributeName: [UIColor whiteColor],
                               NSFontAttributeName:[UIFont systemFontOfSize:18]
                               };
    
    self.navigationBar.titleTextAttributes = titleDic;
    self.navigationBar.barTintColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
