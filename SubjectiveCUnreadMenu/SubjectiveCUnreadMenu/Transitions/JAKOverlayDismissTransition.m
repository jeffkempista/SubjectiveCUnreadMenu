//
//  JAKOverlayDismissTransition.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 4/1/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKOverlayDismissTransition.h"

@implementation JAKOverlayDismissTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *dissmissingViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transitionDuration
                     animations:^{
                         dissmissingViewController.view.alpha = 0.f;
                     }
                     completion:^(BOOL finished) {
                         BOOL transitionWasCancelled = [transitionContext transitionWasCancelled];
                         [transitionContext completeTransition:transitionWasCancelled == NO];
                     }];
}

@end
