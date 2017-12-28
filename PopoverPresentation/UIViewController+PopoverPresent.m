//
//  UIViewController+PopoverPresent.m
//  QingClassSaas
//
//  Created by xiangchao on 2017/12/21.
//  Copyright © 2017年 QingClass. All rights reserved.
//

#import "UIViewController+PopoverPresent.h"
#import "UIView+MJExtension.h"
#import <objc/runtime.h>

@interface QCPopoverTransition : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, weak) UIViewController *presentedViewController;
@end

@interface UIViewController ()
@property (nonatomic, strong) QCPopoverTransition *pp_transition;
@property (nonatomic, assign) CGPoint pp_arrowPoint;
@end

@implementation QCPopoverTransition
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (fromVc.presentingViewController == toVc) {//dismiss
        
    }else {
        toView.layer.cornerRadius = 5;
        toView.clipsToBounds = YES;
        _presentedViewController = toVc;
        UIView *contentView = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [container addSubview:fromView];
        [container addSubview:contentView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [contentView addGestureRecognizer:tap];
        CGPoint arrowPoint = toVc.pp_arrowPoint;
        UIImageView *arrow = [UIImageView new];
        arrow.image = [UIImage imageNamed:@"menu_arrow"];
        arrow.layer.anchorPoint = CGPointMake(0.5, 0);
        arrow.center = arrowPoint;
        arrow.mj_x -= 5;
        [arrow sizeToFit];
        [container addSubview:arrow];
        
        toView.frame = CGRectMake(arrow.frame.origin.x - 80, CGRectGetMaxY(arrow.frame) - 2, toVc.preferredContentSize.width, toVc.preferredContentSize.height);
        if (CGRectGetMaxX(toView.frame) > contentView.bounds.size.width - 4) {
            toView.mj_x = contentView.mj_w - 4 - toView.mj_w;
        }else if (toView.mj_x < 0) {
            toView.mj_x = 4;
        }
        [container addSubview:toView];
        [transitionContext completeTransition:YES];
    }
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)onTap {
    [_presentedViewController dismissViewControllerAnimated:NO completion:NULL];
}
@end

static NSString * const kArrowPointKey = @"kArrowPointKey";
static NSString * const kTransitionKey = @"kTransitionKey";
@implementation UIViewController (PopoverPresent)
- (CGPoint)pp_arrowPoint {
    return [objc_getAssociatedObject(self, &kArrowPointKey) CGPointValue];
}

- (void)setPp_arrowPoint:(CGPoint)pp_arrowPoint {
    objc_setAssociatedObject(self, &kArrowPointKey, @(pp_arrowPoint), OBJC_ASSOCIATION_RETAIN);
}

- (QCPopoverTransition *)pp_transition {
    return objc_getAssociatedObject(self, &kTransitionKey);
}

- (void)setPp_transition:(QCPopoverTransition *)pp_transition {
    objc_setAssociatedObject(self, &kTransitionKey, pp_transition, OBJC_ASSOCIATION_RETAIN);
}

- (void)pp_presentViewController:(UIViewController *)viewController sourceView:(UIView *)sourceView {
    viewController.transitioningDelegate = self;
    viewController.modalPresentationStyle = UIModalPresentationCustom;
    viewController.pp_transition = [QCPopoverTransition new];
    viewController.pp_arrowPoint = [sourceView.superview convertPoint:CGPointMake(sourceView.center.x, sourceView.bounds.size.height) toView:[UIApplication sharedApplication].keyWindow];
    [self presentViewController:viewController animated:YES completion:NULL];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return presented.pp_transition;
}
@end
