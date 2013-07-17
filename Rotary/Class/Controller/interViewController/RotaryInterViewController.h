//
//  RotaryInterViewController.h
//  Rotary
//
//  Created by Evan on 13-7-14.
//  Copyright (c) 2013年 Evan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface RotaryInterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property int btnTag;

@property (retain, nonatomic) UIButton *backBtn;
@property (retain, nonatomic) UIButton *earlierBtn;
@property (retain, nonatomic) UILabel  *masterLab;
@property (retain, nonatomic) UIButton *riMasterBtn;
@property (retain, nonatomic) UIButton *themeBtn;
@property (retain, nonatomic) UIButton *knowledgeBtn;
@property (retain, nonatomic) UIButton *historyBtn;

@property (retain, nonatomic) UIScrollView  *masterView;
@property (retain, nonatomic) UIView        *knowledgeView;
@property (retain, nonatomic) UIScrollView        *themeView;
@property (retain, nonatomic) UIView        *historyView;
@property (retain, nonatomic) UIView        *responsibilityView;

@end
