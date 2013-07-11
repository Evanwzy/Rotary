//
//  RotaryRightSlideViewController.m
//  Rotary
//
//  Created by Evan on 13-7-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RotaryRightSlideViewController.h"
#import "RotaryHomeViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MMSideDrawerSectionHeaderView.h"

@interface RotaryRightSlideViewController ()

@end

@implementation RotaryRightSlideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:66.0/255.0
                                                  green:69.0/255.0
                                                   blue:71.0/255.0
                                                  alpha:1.0]];
    
    //setting Buttons
    UIButton *ourRotaryBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ourRotaryBtn setFrame:CGRectMake(20.0f, 10.0f, 160.0f, 32.0f)];
    [ourRotaryBtn setTitle:@"Our Rotary" forState:UIControlStateNormal];
    [ourRotaryBtn addTarget:self action:@selector(ourRotaryPressed) forControlEvents:UIControlEventTouchUpInside];
    
    //add subview
    [self.view addSubview:ourRotaryBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ourRotaryPressed {
    NSLog(@"1");
    RotaryHomeViewController * center = [[RotaryHomeViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:center];
    [self.mm_drawerController
     setCenterViewController:nav
     withCloseAnimation:YES
     completion:nil];
}

@end
