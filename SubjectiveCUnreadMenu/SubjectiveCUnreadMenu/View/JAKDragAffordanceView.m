//
//  JAKDragAffordanceView.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 3/31/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKDragAffordanceView.h"

#import "JAKSpringExpandView.h"

@interface JAKDragAffordanceView ()

@property (nonatomic, strong) NSArray *springExpandingViews;

@end

@implementation JAKDragAffordanceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildExpandingViews];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self buildExpandingViews];
    }
    return self;
}

- (void)buildExpandingViews
{
    int numberOfSpringExpandingViews = 3;
    NSMutableArray *springExpandingViews = [[NSMutableArray alloc] initWithCapacity:numberOfSpringExpandingViews];
    for (int i=0; i<numberOfSpringExpandingViews; i++) {
        JAKSpringExpandView *springExpandingView = [[JAKSpringExpandView alloc] initWithFrame:CGRectZero];
        [self addSubview:springExpandingView];
        [springExpandingViews addObject:springExpandingView];
    }
    
    _springExpandingViews = [NSArray arrayWithArray:springExpandingViews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat interItemSpace = CGRectGetWidth(self.bounds) / self.springExpandingViews.count;
    
    NSInteger index = 0;
    for (JAKSpringExpandView *springExpandingView in self.springExpandingViews) {
        springExpandingView.frame = CGRectMake(interItemSpace * index, 0.f, 4.f, CGRectGetHeight(self.bounds));
        index++;
    }
}

#pragma mark - Property overrides

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    CGFloat progressInterval = 1.0f / self.springExpandingViews.count;
    
    NSInteger index = 0;
    for (JAKSpringExpandView *springExpandingView in self.springExpandingViews) {
        BOOL expanded = ((index * progressInterval) + progressInterval < progress);
        
        if (progress >= 1.f) {
            [springExpandingView setColor:[UIColor redColor]];
        }
        else if (expanded) {
            [springExpandingView setColor:[UIColor blackColor]];
        } else {
            [springExpandingView setColor:[UIColor grayColor]];
        }
        
        [springExpandingView setExpanded:expanded animated:YES];
        index++;
    }
}

@end
