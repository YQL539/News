//
//  NewsTabBarController.m
//  新闻APP
//
//  Created by 胡锦吾 on 16/6/9.
//  Copyright © 2016年 YQL. All rights reserved.
//

#import "NewsTabBarController.h"
#import "NewsViewController.h"
#import "PictureViewController.h"
#import "VideoViewController.h"
#import "MeViewController.h"
#import "NavigationController.h"

@interface NewsTabBarController ()

@end

@implementation NewsTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NewsViewController *V1 = [[NewsViewController alloc]init];
    [self addChildViewController:V1 withImage:[UIImage imageNamed:@"tabbar_news"] selectedImage:[UIImage imageNamed:@"tabbar_news_hl"] withTitle:@"新闻"];
    
    PictureViewController *V2 = [[PictureViewController alloc]init];
    [self addChildViewController:V2 withImage:[UIImage imageNamed:@"tabbar_picture"] selectedImage:[UIImage imageNamed:@"tabbar_picture_hl"] withTitle:@"图片"];
    VideoViewController *V3 = [[VideoViewController alloc]init];
    [self addChildViewController:V3 withImage:[UIImage imageNamed:@"tabbar_video"] selectedImage:[UIImage imageNamed:@"tabbar_video_hl"] withTitle:@"视频"];
    
    MeViewController *V4 = [[MeViewController alloc]init];
    [self addChildViewController:V4 withImage:[UIImage imageNamed:@"tabbar_setting"] selectedImage:[UIImage imageNamed:@"tabbar_setting_hl"] withTitle:@"我"];
    
    
}

-(void)addChildViewController:(UIViewController *)controller withImage:(UIImage *)image selectedImage:(UIImage *)selectedImage withTitle:(NSString *)title{
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:controller];
    [nav.tabBarItem setImage:image];
    nav.navigationBar.barTintColor = [UIColor redColor];
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]}
    ;
    nav.navigationBar.translucent = YES;
    [nav.tabBarItem setSelectedImage:selectedImage];
    nav.tabBarItem.title = title;
    controller.navigationItem.title = title;
    
    nav.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
}


@end
