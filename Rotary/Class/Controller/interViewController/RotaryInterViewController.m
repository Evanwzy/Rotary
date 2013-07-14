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
    
    //set btnTag
    _btnTag =1;
    
    //set UI
    [self setupUI];
    
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden =NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title =@"國際扶輪";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setupUI 

- (void)setupUI {
    self.navigationController.navigationBarHidden =NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title =@"國際扶輪";
    
    [self setupRightMenuButton];
    [self setupLeftMenuButton];
    
    
    //bottom button
    _riMasterBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_riMasterBtn setTag:1];
    [_riMasterBtn setTitle:@"RI社长" forState:UIControlStateNormal];
    [_riMasterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_riMasterBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    _riMasterBtn.frame=CGRectMake(0.0f, 372.0f, 80.0f, 44.0f);
    [_riMasterBtn addTarget:self action:@selector(bottomMasterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _themeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_themeBtn setTag:2];
    [_themeBtn setTitle:@"主题" forState:UIControlStateNormal];
    [_themeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_themeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    _themeBtn.frame=CGRectMake(80.0f, 372.0f, 80.0f, 44.0f);
    [_themeBtn addTarget:self action:@selector(bottomThemeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _historyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_historyBtn setTag:3];
    [_historyBtn setTitle:@"沿革" forState:UIControlStateNormal];
    [_historyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_historyBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    _historyBtn.frame=CGRectMake(160.0f, 372.0f, 80.0f, 44.0f);
    [_historyBtn addTarget:self action:@selector(bottomHistoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _knowledgeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_knowledgeBtn setTag:4];
    [_knowledgeBtn setTitle:@"知識" forState:UIControlStateNormal];
    [_knowledgeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_knowledgeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    _knowledgeBtn.frame=CGRectMake(240.0f, 372.0f, 80.0f, 44.0f);
    [_knowledgeBtn addTarget:self action:@selector(bottomKnowledgeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *bottomImg=[UIImage imageNamed:@"dota2.jpg"];
    UIImageView *bottomImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 372.0f, 320.0f, 44.0f)];
    bottomImgView.image=bottomImg;
    
    _riMasterBtn.selected =YES;
    _riMasterBtn.userInteractionEnabled =NO;
    
    //first Btn1
    UIButton *earlierBtn =[UIButton buttonWithType:UIButtonTypeCustom];
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
    
    [self.view addSubview:bottomImgView];
    [self.view addSubview:_riMasterBtn];
    [self.view addSubview:_themeBtn];
    [self.view addSubview:_historyBtn];
    [self.view addSubview:_knowledgeBtn];
    
    [self.view addSubview:masterLab];
    [self.view addSubview:earlierBtn];
    
    [self setupMasterView];
}

- (void)setupMasterView {
    
    //scrollView
    _masterView =[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
//    [_masterView setZoomScale:0.0f];
    
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
    
    
    
    [_masterView addSubview:logoImgView];
    [_masterView addSubview:dateLab];
    [_masterView addSubview:briefIntroductionLab];
    [_masterView addSubview:lineView];
    [_masterView addSubview:headView];
    [_masterView addSubview:nameLab];
    [_masterView addSubview:englishnameLab];
    [_masterView addSubview:nationalityLab];
    [_masterView addSubview:workAddressLab];
    [_masterView addSubview:briefLab];
    [_masterView addSubview:interRotaryLab];
    [_masterView addSubview:picImgView];
    [_masterView setContentSize:CGSizeMake(320.0f, 512.0f)];

    [self.view addSubview:_masterView];
    
}

- (void)setupThemeView {
    
}

- (void)setupHistoryView {
    
}

- (void)setupKnowledgeView {
    
    _knowledgeView =[[UIView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    UIImageView *backImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    UIImage *backImg=[UIImage imageNamed:@"dota2.jpg"];
    backImgView.image=backImg;
    UILabel *rotaryKnowledgeLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    rotaryKnowledgeLab.text=@"扶轮知识";
    rotaryKnowledgeLab.textColor=[UIColor whiteColor];
    rotaryKnowledgeLab.backgroundColor=[UIColor clearColor];
    rotaryKnowledgeLab.textAlignment=UITextAlignmentCenter;
    
    UIImageView *tradeMarkImgView=[[UIImageView alloc]initWithFrame:CGRectMake(110.0f, 44.0f, 100.0f, 40.0f)];
    UIImage *tradeMarkImg=[UIImage imageNamed:@"222.jpg"];
    tradeMarkImgView.image=tradeMarkImg;
    
    UILabel *interRotaryLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 84.0f, 320.0f, 20.0f)];
    interRotaryLab.text=@"国际扶轮";
    interRotaryLab.backgroundColor=[UIColor clearColor];
    interRotaryLab.textAlignment=UITextAlignmentCenter;
    
    UILabel *KnowledgeLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 104.0f, 320.0f, 20.0f)];
    KnowledgeLab.text=@"扶轮知识";
    KnowledgeLab.backgroundColor=[UIColor clearColor];
    KnowledgeLab.textAlignment=UITextAlignmentCenter;

    UIImageView *interRotaryImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 124.0f, 320.0f, 30.0f)];
    UIImage *interRotaryImg=[UIImage imageNamed:@"dota2.jpg"];
    interRotaryImgView.image=interRotaryImg;
    UIButton *interRotaryBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [interRotaryBtn setFrame:CGRectMake(0.0f, 124.0f, 320.0f, 30.0f)];
    [interRotaryBtn setTitle:@"国际扶轮" forState:UIControlStateNormal];
    interRotaryBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    interRotaryBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    
    UIImageView *rotaryOrganizationImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 154.0f, 320.0f, 30.0f)];
    UIImage *rotaryOrganizationImg=[UIImage imageNamed:@"dota2.jpg"];
    rotaryOrganizationImgView.image=rotaryOrganizationImg;
    UIButton *rotaryOrganizationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [rotaryOrganizationBtn setFrame:CGRectMake(0.0f, 154.0f, 320.0f, 30.0f)];
    [rotaryOrganizationBtn setTitle:@"扶轮组织" forState:UIControlStateNormal];
    rotaryOrganizationBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    rotaryOrganizationBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    
    UIImageView *testImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 184.0f, 320.0f, 30.0f)];
    UIImage *testImg=[UIImage imageNamed:@"dota2.jpg"];
    testImgView.image=testImg;
    UIButton *testBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setFrame:CGRectMake(0.0f, 184.0f, 320.0f, 30.0f)];
    [testBtn setTitle:@"四大考验" forState:UIControlStateNormal];
    testBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    testBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);


    UIImageView *committeeImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 214.0f, 320.0f, 30.0f)];
    UIImage *committeeImg=[UIImage imageNamed:@"dota2.jpg"];
    committeeImgView.image=committeeImg;
    UIButton *committeeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [committeeBtn setFrame:CGRectMake(0.0f, 214.0f, 320.0f, 30.0f)];
    [committeeBtn setTitle:@"五大委员会" forState:UIControlStateNormal];
    committeeBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    committeeBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);

    UIImageView *responsibilityImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 244.0f, 320.0f, 30.0f)];
    UIImage *responsibilityImg=[UIImage imageNamed:@"dota2.jpg"];
    responsibilityImgView.image=responsibilityImg;
    UIButton *responsibilityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [responsibilityBtn setFrame:CGRectMake(0.0f, 244.0f, 320.0f, 30.0f)];
    [responsibilityBtn setTitle:@"四大考验" forState:UIControlStateNormal];
    responsibilityBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    responsibilityBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);

       
    [_knowledgeView addSubview:backImgView];
    [_knowledgeView addSubview:rotaryKnowledgeLab];
    [_knowledgeView addSubview:tradeMarkImgView];
    [_knowledgeView addSubview:interRotaryLab];
    [_knowledgeView addSubview:KnowledgeLab];
    [_knowledgeView addSubview:interRotaryImgView];
    [_knowledgeView addSubview:interRotaryBtn];
    [_knowledgeView addSubview:rotaryOrganizationImgView];
    [_knowledgeView addSubview:rotaryOrganizationBtn];
    [_knowledgeView addSubview:testImgView];
    [_knowledgeView addSubview:testBtn];
    [_knowledgeView addSubview:committeeImgView];
    [_knowledgeView addSubview:committeeBtn];
    [_knowledgeView addSubview:responsibilityImgView];
    [_knowledgeView addSubview:responsibilityBtn];
    [self.view addSubview:_knowledgeView];
}

- (void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}

- (void)removeViewFromSuperView {
    switch (_btnTag) {
        case 1:
            [_masterView removeFromSuperview];
            break;
        case 2:
            ;
            break;
        case 3:
            ;
            break;
        case 4:
            [_knowledgeView removeFromSuperview];
            break;
            
        default:
            break;
    }
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

#pragma mark - button action

//naviBar Action
-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

//button action

- (void)bottomMasterBtnAction :(id)sender {
    UIButton *send =sender;
    if (_btnTag !=send.tag) {
        [self removeViewFromSuperView];
        [self setupMasterView];
        
        _riMasterBtn.selected =YES;
        _riMasterBtn.userInteractionEnabled =NO;
        _themeBtn.selected =NO;
        _themeBtn.userInteractionEnabled =YES;
        _historyBtn.selected =NO;
        _historyBtn.userInteractionEnabled =YES;
        _knowledgeBtn.selected =NO;
        _knowledgeBtn.userInteractionEnabled =YES;
        _btnTag =1;
        NSLog(@"1");
    }
}

- (void)bottomThemeBtnAction :(id)sender {
    UIButton *send =sender;
    if (_btnTag !=send.tag) {
        
        
        _riMasterBtn.selected =NO;
        _riMasterBtn.userInteractionEnabled =YES;
        _themeBtn.selected =YES;
        _themeBtn.userInteractionEnabled =NO;
        _historyBtn.selected =NO;
        _historyBtn.userInteractionEnabled =YES;
        _knowledgeBtn.selected =NO;
        _knowledgeBtn.userInteractionEnabled =YES;
        _btnTag =2;
        NSLog(@"2");
    }
}

- (void)bottomHistoryBtnAction :(id)sender {
    UIButton *send =sender;
    if (_btnTag !=send.tag) {
        _riMasterBtn.selected =NO;
        _riMasterBtn.userInteractionEnabled =YES;
        _themeBtn.selected =NO;
        _themeBtn.userInteractionEnabled =YES;
        _historyBtn.selected =YES;
        _historyBtn.userInteractionEnabled =NO;
        _knowledgeBtn.selected =NO;
        _knowledgeBtn.userInteractionEnabled =YES;
        _btnTag =3;
        NSLog(@"3");
    }
}

- (void)bottomKnowledgeBtnAction :(id)sender {
    UIButton *send =sender;
    if (_btnTag !=send.tag) {
        [self removeViewFromSuperView];
        [self setupKnowledgeView];
        
        _riMasterBtn.selected =NO;
        _riMasterBtn.userInteractionEnabled =YES;
        _themeBtn.selected =NO;
        _themeBtn.userInteractionEnabled =YES;
        _historyBtn.selected =NO;
        _historyBtn.userInteractionEnabled =YES;
        _knowledgeBtn.selected =YES;
        _knowledgeBtn.userInteractionEnabled =NO;
        _btnTag =4;
        
        NSLog(@"4");
    }
}

@end
