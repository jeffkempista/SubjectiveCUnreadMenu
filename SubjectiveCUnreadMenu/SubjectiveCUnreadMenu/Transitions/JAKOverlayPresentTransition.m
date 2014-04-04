//
//  JAKOverlayPresentTransition.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 4/1/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKOverlayPresentTransition.h"

@implementation JAKOverlayPresentTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *presentingViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *overlayViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:presentingViewController.view];
    [containerView addSubview:overlayViewController.view];
    
    overlayViewController.view.alpha = 0.f;
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transitionDuration
                     animations:^{
                         overlayViewController.view.alpha = 0.9f;
                     }
                     completion:^(BOOL finished) {
                         BOOL transitionWasCancelled = [transitionContext transitionWasCancelled];
                         [transitionContext completeTransition:transitionWasCancelled == NO];
                     }];

}

@end
