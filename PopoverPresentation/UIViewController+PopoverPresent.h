//
//  UIViewController+PopoverPresent.h
//  QingClassSaas
//
//  Created by xiangchao on 2017/12/21.
//  Copyright © 2017年 QingClass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopoverPresent) <UIViewControllerTransitioningDelegate>

- (void)pp_presentViewController:(UIViewController *)viewController sourceView:(UIView *)sourceView;
@end
