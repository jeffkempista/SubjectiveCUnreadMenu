//
//  JAKContentWIthMenuViewController.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 4/1/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKContentWIthMenuViewController.h"

#import "JAKMenuViewController.h"
#import "JAKDragAffordanceView.h"
#import "JAKOverlayPresentTransition.h"
#import "JAKOverlayDismissTransition.h"

@interface JAKContentWIthMenuViewController () <UIScrollViewDelegate, UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *enclosingScrollView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet JAKDragAffordanceView *menuDragAffordanceView;

@end

@implementation JAKContentWIthMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enclosingScrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    self.textView.textContainerInset = UIEdgeInsetsMake(40.f, 20.f, 20.f, 20.f);
    self.textView.font = [UIFont fontWithName:@"AvenirNext-Regular" size:16.f];
    
    NSString *contentPlistPath = [[NSBundle mainBundle] pathForResource:@"ArticleContent" ofType:@"plist"];
    NSDictionary *contentDictionary = [NSDictionary dictionaryWithContentsOfFile:contentPlistPath];
    self.textView.text = [contentDictionary valueForKey:@"body"];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.isDragging) {
        self.menuDragAffordanceView.progress = scrollView.contentOffset.x / CGRectGetWidth(self.menuDragAffordanceView.bounds);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.menuDragAffordanceView.progress >= 1.f) {
        [self performSegueWithIdentifier:@"PresentMenu" sender:self];
    }
    else {
        self.menuDragAffordanceView.progress = 0.f;
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.transitioningDelegate = self;
    destinationViewController.modalPresentationStyle = UIModalPresentationCustom;
}

- (IBAction)unwindToContentWithMenuViewController:(UIStoryboardSegue *)segue
{ }

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[JAKOverlayPresentTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[JAKOverlayDismissTransition alloc] init];
}

@end
