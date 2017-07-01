//
//  UYTabBar.h
//  Weibo
//
//  Created by jiangys on 15/6/22.
//  Copyright (c) 2015年 uxiaoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UYTabBar;

#warning 因为UYTabBar继承自UITabBar，所以称为UYTabBar的代理，也必须实现UITabBar的代理协议
@protocol UYTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(UYTabBar *)tabBar;
@end

@interface UYTabBar : UITabBar
@property (nonatomic, weak) id<UYTabBarDelegate> delegate;
@end
