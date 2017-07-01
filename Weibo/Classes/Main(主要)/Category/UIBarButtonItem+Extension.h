//
//  UIBarButtonItem+Extension.h
//  Weibo
//
//  Created by jiangys on 15/6/23.
//  Copyright (c) 2015年 uxiaoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
