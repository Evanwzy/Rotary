//
//  RotaryInterViewController.m
//  Rotary
//
//  Created by Evan on 13-7-14.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RotaryInterViewController.h"
#import "RotaryHomeViewController.h"

#import "RotaryRightSlideViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMDrawerBarButtonItem.h"
#import "MMCenterTableViewCell.h"

@interface RotaryInterViewController ()

@end

@implementation RotaryInterViewController

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
    self.navigationController.navigationBarHidden =NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title =@"國際扶輪";
    
    [self setupRightMenuButton];
    [self setupLeftMenuButton];
    
        
//    UIImageView *imageV =[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 400.0f)];
//    imageV.image =[UIImage imageNamed:@"333.jpg"];
//    [sv1 addSubview:imageV];
    //first Btn1
    UIButton *earlierBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [earlierBtn setTitle:@"历届" forState:UIControlStateNormal];
    [earlierBtn setTitle:@"历届" forState:UIControlStateNormal];
    [earlierBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [earlierBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateSelected];
    [earlierBtn setBackgroundImage:[UIImage imageNamed:@"dota2.jpg"] forState:(UIControlStateNormal)];
    [earlierBtn setBackgroundImage:[UIImage imageNamed:@"dota2.jpg"] forState:UIControlStateSelected];
    earlierBtn.frame =CGRectMake(270.0f, 0.0f, 50.0f, 44.0f);
    [earlierBtn addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];

    
    UILabel *masterLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    UIColor *masterLabBackground=[UIColor colorWithPatternImage:[UIImage imageNamed:@"333.jpg"]];
    [masterLab setBackgroundColor:masterLabBackground];
    masterLab.text=@"RI社长";
    masterLab.textColor=[UIColor whiteColor];
    masterLab.textAlignment=UITextAlignmentCenter;
    
            
        
    //bottom button
    UIButton *riMasterBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [riMasterBtn setTitle:@"RI社长" forState:UIControlStateNormal];
    [riMasterBtn setTitle:@"RI社长" forState:UIControlStateSelected];
    [riMasterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [riMasterBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    riMasterBtn.frame=CGRectMake(0.0f, 372.0f, 80.0f, 44.0f);
    
    UIButton *themeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [themeBtn setTitle:@"主题" forState:UIControlStateNormal];
    [themeBtn setTitle:@"主题" forState:UIControlStateSelected];
    [themeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [themeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    themeBtn.frame=CGRectMake(80.0f, 372.0f, 80.0f, 44.0f);
    
    UIButton *historyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [historyBtn setTitle:@"沿革" forState:UIControlStateNormal];
    [historyBtn setTitle:@"沿革" forState:UIControlStateSelected];
    [historyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [historyBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    historyBtn.frame=CGRectMake(160.0f, 372.0f, 80.0f, 44.0f);
    
    UIButton *knowledgeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [knowledgeBtn setTitle:@"沿革" forState:UIControlStateNormal];
    [knowledgeBtn setTitle:@"沿革" forState:UIControlStateSelected];
    [knowledgeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [knowledgeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    knowledgeBtn.frame=CGRectMake(240.0f, 372.0f, 80.0f, 44.0f);
    
    UIImage *bottomImg=[UIImage imageNamed:@"dota2.jpg"];
    UIImageView *bottomImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 372.0f, 320.0f, 44.0f)];
    bottomImgView.image=bottomImg;
    
    [self.view addSubview:masterLab];
    [self.view addSubview:earlierBtn];
    [self.view addSubview:bottomImgView];
    [self.view addSubview:riMasterBtn];
    [self.view addSubview:themeBtn];
    [self.view addSubview:historyBtn];
    [self.view addSubview:knowledgeBtn];
    [self setupScrollView];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setupUI 
- (void)setupScrollView {
    
    //scrollView
    UIScrollView *sv1 =[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
//    [sv1 setZoomScale:0.0f];
    
    //second logoImage
    UIImage *logoImg =[UIImage imageNamed:@"dota2.jpg"];
    UIImageView *logoImgView =[[UIImageView alloc]initWithFrame:CGRectMake(120.0f, 0.0f, 80.0f, 30.0f)];
    logoImgView.image =logoImg;

    UILabel *interRotaryLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 30.0f, 320.0f, 20.0f)];
    UILabel *dateLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 50.0f, 320.0f, 20.0f)];
    UILabel *briefIntroductionLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 70.0f, 320.0f, 20.0f)];
    UIImage *line=[UIImage imageNamed:@"hengxian.jpg"];
    UIImageView *lineView=[[UIImageView alloc]initWithImage:line];
    lineView.frame=CGRectMake(0.0f, 90.0f, 320.0f, 10.0f);
    
    
    [interRotaryLab setBackgroundColor:[UIColor whiteColor]];
    interRotaryLab.text=@"国际扶轮";
    interRotaryLab.textAlignment=UITextAlignmentCenter;
    
    [dateLab setBackgroundColor:[UIColor whiteColor]];
    dateLab.text=@"2005-2006";
    dateLab.textAlignment=UITextAlignmentCenter;
    
    [briefIntroductionLab setBackgroundColor:[UIColor whiteColor]];
    briefIntroductionLab.text=@"RI社长简介";
    briefIntroductionLab.textAlignment=UITextAlignmentCenter;
    
    
    
    UIImage *head=[UIImage imageNamed:@"dota2.jpg"];
    UIImageView *headView=[[UIImageView alloc]initWithFrame:CGRectMake(80.0f, 100.0f, 160.0f, 80.0f)];
    headView.image=head;
    
    UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 180.0f, 320.0f, 20.0f)];
    nameLab.text=@"艾泽拉斯大陆";
    [nameLab setBackgroundColor:[UIColor whiteColor]];
    nameLab.textAlignment=UITextAlignmentCenter;
    
    UILabel *englishnameLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 200.0f, 320.0f, 20.0f)];
    englishnameLab.text=@"World of Warcraft";
    [englishnameLab setBackgroundColor:[UIColor whiteColor]];
    englishnameLab.textAlignment=UITextAlignmentCenter;
    
    UILabel *nationalityLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 220.0f, 320.0f, 20.0f)];
    nationalityLab.text=@"Wizard";
    [nationalityLab setBackgroundColor:[UIColor whiteColor]];
    nationalityLab.textAlignment=UITextAlignmentCenter;
    
    UILabel *workAddressLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 240.0f, 320.0f, 20.0f)];
    workAddressLab.text=@"银月城";
    [workAddressLab setBackgroundColor:[UIColor whiteColor]];
    workAddressLab.textAlignment=UITextAlignmentCenter;
    
    UILabel *briefLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 260.0f, 320.0f, 30.0f)];
    briefLab.text=@"简介 简介 简介 简介";
    [briefLab setBackgroundColor:[UIColor whiteColor]];
    briefLab.textAlignment=UITextAlignmentLeft;
    
    UIImage *picImg=[UIImage imageNamed:@"dota2.jpg"];
    UIImageView *picImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 290.0f, 320.0f, 220.0f)];
    picImgView.image=picImg;
    
    [sv1 addSubview:logoImgView];
    [sv1 addSubview:dateLab];
    [sv1 addSubview:briefIntroductionLab];
    [sv1 addSubview:lineView];
    [sv1 addSubview:headView];
    [sv1 addSubview:nameLab];
    [sv1 addSubview:englishnameLab];
    [sv1 addSubview:nationalityLab];
    [sv1 addSubview:workAddressLab];
    [sv1 addSubview:briefLab];
    [sv1 addSubview:interRotaryLab];
    [sv1 addSubview:picImgView];
    [sv1 setContentSize:CGSizeMake(320.0f, 600.0f)];

    [self.view addSubview:sv1];
    
}

//naviBarItem Action
- (void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

- (void)setupLeftMenuButton{
    UIButton *leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.titleLabel.text =@"首頁";
    [leftBtn setBackgroundColor:[UIColor clearColor]];
    [leftBtn setImage:[UIImage imageNamed:@"333.jpg"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"333.jpg"] forState:UIControlStateSelected];
    leftBtn.frame =CGRectMake(5.0f, 5.0f, 50.0f, 34.0f);
    [leftBtn addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
 
    UIBarButtonItem *leftBarBtn =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    [self.navigationItem setLeftBarButtonItem:leftBarBtn animated:YES];
}


-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
