//
//  RotaryHomeViewController.m
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RotaryHomeViewController.h"
#import "RotaryInfoViewController.h"

#import "RotaryRightSlideViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMDrawerBarButtonItem.h"
#import "MMCenterTableViewCell.h"

@interface RotaryHomeViewController ()

@end

@implementation RotaryHomeViewController

#pragma mark - lifeCycle
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
    // Do any additional setup after loading the view from its nib.
    [[MMExampleDrawerVisualStateManager sharedManager] setRightDrawerAnimationType:2];
    [self setupRightMenuButton];
}

-(void)viewWillAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidUnload {
    [self setInfoBtn:nil];
    [self setImg_1:nil];
    [super viewDidUnload];
}

-(void)dealloc {
    
}

//按钮事件
- (IBAction)homeBtnPressed:(UIButton *)sender {
    int i =sender.tag;
    switch (i) {
        case 101:
            [self jumpToInfoCtr];
            break;
            
        default:
            break;
    }
}

#pragma mark - buttonAction
- (void)jumpToInfoCtr {
    
    RotaryInfoViewController *ivCtr =[[RotaryInfoViewController alloc]init];
    
    [self.navigationController pushViewController:ivCtr animated:YES];
    
}

//naviBarItem Action
- (void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}
@end
