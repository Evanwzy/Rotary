//
//  RotaryInterViewController.h
//  Rotary
//
//  Created by Evan on 13-7-14.
//  Copyright (c) 2013年 Evan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface RotaryInterViewController : UIViewController

@property int btnTag;

@property (retain, nonatomic) UIButton *riMasterBtn;
@property (retain, nonatomic) UIButton *themeBtn;
@property (retain, nonatomic) UIButton *knowledgeBtn;
@property (retain, nonatomic) UIButton *historyBtn;

@property (retain, nonatomic) UIScrollView *masterView;
@property (retain, nonatomic) UIView *knowledgeView;

@end
