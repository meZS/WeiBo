//
//  UYTabBarViewController.m
//  Weibo
//
//  Created by jiangys on 15/6/22.
//  Copyright (c) 2015年 uxiaoyuan. All rights reserved.
//

#import "UYTabBarViewController.h"
#import "UYHomeViewController.h"
#import "UYMessageCenterViewController.h"
#import "UYProfileViewController.h"
#import "UYDiscoverViewController.h"
#import "UYTabBar.h"
#import "UYNavigationController.h"


@interface UYTabBarViewController ()

@end

@implementation UYTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    UYHomeViewController *home = [[UYHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    UYMessageCenterViewController *messageCenter = [[UYMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    UYDiscoverViewController *discover = [[UYDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    UYProfileViewController *profile = [[UYProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    // 2.更换系统自带的tabbar,由于tabbar是realonly，因此使用KVC来重写。如果没有特殊的导航布局，去掉这下面这部分代码即可。
    UYTabBar *tabBar = [[UYTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UYNavigationController *nav = [[UYNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

@end
