//
//  JAKRootViewController.m
//  SubjectiveCUnreadMenu_start
//
//  Created by Jeff Kempista on 3/31/14.
//  Copyright (c) 2014 Jeff Kempista. All rights reserved.
//

#import "JAKStringExpandViewController.h"

#import "JAKSpringExpandView.h"

@interface JAKStringExpandViewController ()

@property (weak, nonatomic) IBOutlet JAKSpringExpandView *springExpandView;

@end

@implementation JAKStringExpandViewController

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

- (IBAction)expandCollapseButtonTapped:(UIButton *)sender
{
    sender.selected = !sender.selected;
    [self.springExpandView setExpanded:sender.selected animated:YES];
    [self.springExpandView setColor:sender.selected ? [UIColor redColor] : [UIColor grayColor]];
}

@end
