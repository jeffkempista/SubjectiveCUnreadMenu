//
//  JAKDragAffordanceViewController.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 3/31/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKDragAffordanceViewController.h"

#import "JAKDragAffordanceView.h"

@interface JAKDragAffordanceViewController ()

@property (weak, nonatomic) IBOutlet JAKDragAffordanceView *dragAffordanceView;
@property (weak, nonatomic) IBOutlet UISlider *dragSlider;

@end

@implementation JAKDragAffordanceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dragSliderValueChanged:(UISlider *)sender
{
    [self.dragAffordanceView setProgress:sender.value];
}

@end
