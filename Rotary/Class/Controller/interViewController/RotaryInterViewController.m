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
#import "RotaryHistoryCell.h"
#import "RotaryMasterHistoryCell.h"
#import "RotaryThemeHistoryCell.h"

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
    // Do any additional setup after loading the view from its nib
    
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
    [_riMasterBtn setTitle:@"RI社長" forState:UIControlStateNormal];
    [_riMasterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_riMasterBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    _riMasterBtn.frame=CGRectMake(0.0f, 372.0f, 80.0f, 44.0f);
    [_riMasterBtn addTarget:self action:@selector(bottomMasterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    _themeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_themeBtn setTag:2];
    [_themeBtn setTitle:@"主題" forState:UIControlStateNormal];
    [_themeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_themeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    _themeBtn.frame=CGRectMake(80.0f, 372.0f, 80.0f, 44.0f);
    [_themeBtn addTarget:self action:@selector(bottomThemeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _historyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_historyBtn setTag:3];
    [_historyBtn setTitle:@"沿革" forState:UIControlStateNormal];
    [_historyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_historyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    _historyBtn.frame=CGRectMake(160.0f, 372.0f, 80.0f, 44.0f);
    [_historyBtn addTarget:self action:@selector(bottomHistoryBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _knowledgeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_knowledgeBtn setTag:4];
    [_knowledgeBtn setTitle:@"知識" forState:UIControlStateNormal];
    [_knowledgeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_knowledgeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    _knowledgeBtn.frame=CGRectMake(240.0f, 372.0f, 80.0f, 44.0f);
    [_knowledgeBtn addTarget:self action:@selector(bottomKnowledgeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *bottomImg=[UIImage imageNamed:@"inter_tabBg.png"];
    bottomImg=[bottomImg resizableImageWithCapInsets:UIEdgeInsetsMake(5,5,5,5)];
    UIImageView *bottomImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 372.0f, 320.0f, 44.0f)];
    bottomImgView.image=bottomImg;
    
    UIImage *line1Img=[UIImage imageNamed:@"inter_Btntabline.png"];
    UIImageView *line1ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(80.0f, 372.0f, 2.0f, 44.0f)];
    line1ImgView.image=line1Img;
    
    UIImage *line2Img=[UIImage imageNamed:@"inter_Btntabline.png"];
    UIImageView *line2ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(160.0f, 372.0f, 2.0f, 44.0f)];
    line2ImgView.image=line2Img;
    
    UIImage *line3Img=[UIImage imageNamed:@"inter_Btntabline.png"];
    UIImageView *line3ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(240.0f, 372.0f, 2.0f, 44.0f)];
    line3ImgView.image=line3Img;
    
        
    _riMasterBtn.selected =YES;
    _riMasterBtn.userInteractionEnabled =NO;
    
    //first Btn1
    _earlierBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    [_earlierBtn setTitle:@"历届" forState:UIControlStateNormal];
    [_earlierBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_earlierBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateSelected];
    [_earlierBtn setBackgroundImage:[UIImage imageNamed:@"inter_earlier.png"] forState:(UIControlStateNormal)];
    _earlierBtn.frame =CGRectMake(277.5f, 13.0f, 35.0f, 18.0f);
    [_earlierBtn addTarget:self action:@selector(historyBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    //back button
    _backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setFrame:CGRectMake(10.0f, 11.5f, 28.0f, 21.0f)];
    [_backBtn setBackgroundColor:[UIColor clearColor]];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"knowledge_back.png"] forState:UIControlStateNormal];
    [_backBtn setHidden:YES];
    [_backBtn addTarget:self action:@selector(bottomKnowledgeBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    _masterLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    UIImage *tmpImg =[UIImage imageNamed:@"inter_tabBg.png"];
    tmpImg = [tmpImg resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    UIColor *masterLabBackground=[UIColor colorWithPatternImage:tmpImg];
    [_masterLab setBackgroundColor:masterLabBackground];
    _masterLab.text=@"RI社長";
//    _masterLab.font =[UIFont boldSystemFontOfSize:18.0f];
    _masterLab.textColor=[UIColor whiteColor];
    _masterLab.textAlignment=UITextAlignmentCenter;
    
    _lineImgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"inter_Btntabline.png"]];
    _lineImgView.frame =CGRectMake(55.0f, 0.0f, 1.0f, 44.0f);
    [_lineImgView setHidden:YES];
    _lineImgView2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"inter_Btntabline.png"]];
    _lineImgView2.frame =CGRectMake(265.0f, 0.0f, 1.0f, 44.0f);
    [_lineImgView2 setHidden:NO];
    
    [self.view addSubview:bottomImgView];
    [self.view addSubview:_riMasterBtn];
    [self.view addSubview:_themeBtn];
    [self.view addSubview:_historyBtn];
    [self.view addSubview:_knowledgeBtn];
    [self.view addSubview:line1ImgView];
    [self.view addSubview:line2ImgView];
    [self.view addSubview:line3ImgView];
    
    [self.view addSubview:_masterLab];
    [self.view addSubview:_earlierBtn];
    [self.view addSubview:_backBtn];
    [self.view addSubview:_lineImgView];
    [self.view addSubview:_lineImgView2];
    [self setupMasterView];
    
    
}

- (void)setupMasterView {
    [_earlierBtn setHidden:NO];
    [_backBtn setHidden:YES];
    [_lineImgView setHidden:YES];
    [_lineImgView2 setHidden:YES];
    _masterLab.text =@"RI社長";
    
    //scrollView
    _masterView =[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
//    [_masterView setZoomScale:0.0f];
    
    //second logoImage
    UIImage *logoImg =[UIImage imageNamed:@"inter_logo.png"];
    UIImageView *logoImgView =[[UIImageView alloc]initWithFrame:CGRectMake(136.25f, 0.0f, 47.5f, 48.0f)];
    logoImgView.image =logoImg;

    UILabel *interRotaryLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 58.0f, 320.0f, 20.0f)];
    UILabel *dateLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 78.0f, 320.0f, 20.0f)];
    UILabel *briefIntroductionLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 103.0f, 320.0f, 15.0f)];
    
    UIImage *line=[UIImage imageNamed:@"inter_line.png"];
    line=[line resizableImageWithCapInsets:UIEdgeInsetsMake(0.25f, 0.25f, 0.25f, 0.25f)];
    UIImageView *lineView=[[UIImageView alloc]initWithImage:line];
    lineView.frame=CGRectMake(14.25f, 123.5f,291.5f, 1.0f);
    
    
    [interRotaryLab setBackgroundColor:[UIColor whiteColor]];
    interRotaryLab.text=@"國際扶輪";
    [interRotaryLab setFont:[UIFont systemFontOfSize:14]];
    interRotaryLab.textAlignment=UITextAlignmentCenter;
    
    [dateLab setBackgroundColor:[UIColor whiteColor]];
    dateLab.text=@"2005-2006";
    [dateLab setFont:[UIFont systemFontOfSize:13]];
    dateLab.textAlignment=UITextAlignmentCenter;
    
    [briefIntroductionLab setBackgroundColor:[UIColor whiteColor]];
    briefIntroductionLab.text=@"RI社長簡介";
    [briefIntroductionLab setFont:[UIFont systemFontOfSize:15]];
    briefIntroductionLab.textAlignment=UITextAlignmentCenter;
    
    
    
    UIImage *head=[UIImage imageNamed:@"inter_head.png"];
    UIImageView *headView=[[UIImageView alloc]initWithFrame:CGRectMake(107.0f, 143.5f, 106.0f, 133.0f)];
    headView.image=head;
    
    UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 286.5f, 320.0f, 20.0f)];
    nameLab.text=@"威罕.施富汗";
    [nameLab setBackgroundColor:[UIColor whiteColor]];
    nameLab.textAlignment=UITextAlignmentCenter;
    [nameLab setFont:[UIFont systemFontOfSize:13]];
    
    UILabel *englishnameLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 306.5f, 320.0f, 20.0f)];
    englishnameLab.text=@"Wilhelm Stechammar";
    [englishnameLab setBackgroundColor:[UIColor whiteColor]];
    englishnameLab.textAlignment=UITextAlignmentCenter;
    [englishnameLab setFont:[UIFont systemFontOfSize:13]];
    
    UILabel *nationalityLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 326.5f, 320.0f, 20.0f)];
    nationalityLab.text=@"美國";
    [nationalityLab setBackgroundColor:[UIColor whiteColor]];
    nationalityLab.textAlignment=UITextAlignmentCenter;
    [nationalityLab setFont:[UIFont systemFontOfSize:13]];
    
    UITextView *briefText=[[UITextView alloc]initWithFrame:CGRectMake(10.5f, 356.5f, 299.0f, 100.0f)];
    briefText.text=@"简介 简介 简介 简介 简介 ...";
    [briefText setFont:[UIFont systemFontOfSize:13]];
    briefText.editable =NO;
    
    UIImage *picImg=[UIImage imageNamed:@"inter_pic.png"];
    UIImageView *picImgView=[[UIImageView alloc]initWithFrame:CGRectMake(10.5f, 456.5f, 299.0f,195.0f)];
    picImgView.image=picImg;
    
    
    
    [_masterView addSubview:logoImgView];
    [_masterView addSubview:dateLab];
    [_masterView addSubview:briefIntroductionLab];
    [_masterView addSubview:lineView];
    [_masterView addSubview:headView];
    [_masterView addSubview:nameLab];
    [_masterView addSubview:englishnameLab];
    [_masterView addSubview:nationalityLab];
    [_masterView addSubview:briefText];
    [_masterView addSubview:interRotaryLab];
    [_masterView addSubview:picImgView];
    [_masterView setContentSize:CGSizeMake(320.0f, 658.5)];

    [self.view addSubview:_masterView];
    
}

- (void)setupThemeView {
    [_earlierBtn setHidden:NO];
    [_backBtn setHidden:YES];
    [_lineImgView setHidden:YES];
    [_lineImgView2 setHidden:NO];
    _masterLab.text=@"年度主題";
    
    _themeView=[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    UIImageView *oneImgView=[[UIImageView alloc]initWithFrame:CGRectMake(136.25f, 0.0f, 47.5f, 48.0f)];
    UIImage *oneImg=[UIImage imageNamed:@"theme_toplogo.png"];
    oneImgView.image=oneImg;
    UILabel *oneLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 58.0f, 320.0f, 20.0f)];
    [oneLab setText:@"國際扶輪"];
    [oneLab setBackgroundColor:[UIColor clearColor]];
    oneLab.textAlignment=UITextAlignmentCenter;
    [oneLab setFont:[UIFont systemFontOfSize:14]];
    
    UILabel *twoLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 78.0f, 320.0f, 20.0f)];
    [twoLab setText:@"2005-2006"];
    [twoLab setBackgroundColor:[UIColor clearColor]];
    twoLab.textAlignment=UITextAlignmentCenter;
    [twoLab setFont:[UIFont systemFontOfSize:13]];

    UILabel *threeLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 103.0f, 320.0f, 15.0f)];
    [threeLab setText:@"年度主題"];
    [threeLab setBackgroundColor:[UIColor clearColor]];
    threeLab.textAlignment=UITextAlignmentCenter;
    [threeLab setFont:[UIFont systemFontOfSize:14]];
    
    UIImageView *line1ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 123.5f,291.5f, 1.0f)];
    UIImage *line1Img=[UIImage imageNamed:@"theme_line.png"];
    line1ImgView.image=line1Img;
    
    UIImageView *midImgView=[[UIImageView alloc]initWithFrame:CGRectMake(12.5f, 143.0f, 295.0f, 209.5f)];
    UIImage *midImg=[UIImage imageNamed:@"theme_midlogo.png"];
    midImgView.image=midImg;
    
    UIImageView *line2ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 352.5f, 320.0f, 1.0f)];
    UIImage *line2Img=[UIImage imageNamed:@"theme_line.png"];
    line2ImgView.image=line2Img;
    
    UITextView *sixLab=[[UITextView alloc]initWithFrame:CGRectMake(0.0f, 353.5f, 320.0f, 100.0f)];
    [sixLab setText:@"主題敘述"];
    sixLab.textAlignment=UITextAlignmentLeft;
    [sixLab setFont:[UIFont systemFontOfSize:13]];
    sixLab.editable =NO;

    [_themeView addSubview:oneImgView];
    [_themeView addSubview:oneLab];
    [_themeView addSubview:twoLab];
    [_themeView addSubview:threeLab];
    [_themeView addSubview:line1ImgView];
    [_themeView addSubview:midImgView];
    [_themeView addSubview:line2ImgView];
    [_themeView addSubview:sixLab];
    [_themeView setContentSize:CGSizeMake(320.0f, 453.5f)];
    [self.view addSubview:_themeView];
}

- (void)setupHistoryView {
    [_earlierBtn setHidden:YES];
    [_backBtn setHidden:YES];
    [_lineImgView setHidden:YES];
    [_lineImgView2 setHidden:YES];
    _masterLab.text=@"扶轮沿革";
    
    _historyView=[[UIView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    UIImageView *oneImgView=[[UIImageView alloc]initWithFrame:CGRectMake(136.25f, 0.0f, 47.5f, 48.0f)];
    UIImage *oneImg=[UIImage imageNamed:@"theme_toplogo.png"];
    oneImgView.image=oneImg;
    UILabel *oneLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 58.0f, 320.0f, 20.0f)];
    [oneLab setText:@"國際扶輪"];
    [oneLab setBackgroundColor:[UIColor clearColor]];
    oneLab.textAlignment=UITextAlignmentCenter;
    [oneLab setFont:[UIFont systemFontOfSize:13]];
    
    UILabel *twoLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 78.0f, 320.0f, 20.0f)];
    [twoLab setText:@"扶輪沿革"];
    [twoLab setBackgroundColor:[UIColor clearColor]];
    twoLab.textAlignment=UITextAlignmentCenter;
    [twoLab setFont:[UIFont systemFontOfSize:14]];
    
    
    UITableView *historyTableView=[[UITableView alloc]initWithFrame:CGRectMake(10.0f, 108.0f, 300.0f, 200.0f)];
    historyTableView.delegate =self;
    historyTableView.dataSource =self;
    
    [_historyView addSubview:oneImgView];
    [_historyView addSubview:oneLab];
    [_historyView addSubview:twoLab];
    [_historyView addSubview:historyTableView];
    [self.view addSubview:_historyView];
}

- (void)setupKnowledgeView {
    [_earlierBtn setHidden:YES];
    [_backBtn setHidden:YES];
    [_lineImgView setHidden:YES];
    [_lineImgView2 setHidden:YES];
    _masterLab.text =@"扶輪知識";
    
    _knowledgeView =[[UIView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    
    UIImageView *tradeMarkImgView=[[UIImageView alloc]initWithFrame:CGRectMake(136.25f, 0.0f, 47.5f, 48.0f)];
    UIImage *tradeMarkImg=[UIImage imageNamed:@"knowledge_toplogo.png"];
    tradeMarkImgView.image=tradeMarkImg;
    
    UILabel *interRotaryLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 53.0f, 320.0f,15.0f)];
    interRotaryLab.text=@"國際扶輪";
    interRotaryLab.backgroundColor=[UIColor clearColor];
    interRotaryLab.textAlignment=UITextAlignmentCenter;
    [interRotaryLab setFont:[UIFont systemFontOfSize:12]];
    
        
    UILabel *KnowledgeLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 75.0f, 320.0f, 15.0f)];
    KnowledgeLab.text=@"扶輪知識";
    KnowledgeLab.backgroundColor=[UIColor clearColor];
    KnowledgeLab.textAlignment=UITextAlignmentCenter;
    [KnowledgeLab setFont:[UIFont systemFontOfSize:15]];
    
    UIImageView *line1ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 100.0f, 291.5f, 2.0f)];
    UIImage *line1Img=[UIImage imageNamed:@"knowledge_line.png"];
    line1ImgView.image=line1Img;


    UIButton *interRotaryBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [interRotaryBtn setFrame:CGRectMake(0.0f, 110.0f, 320.0f, 25.0f)];
    [interRotaryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [interRotaryBtn setTitle:@"國際扶輪" forState:UIControlStateNormal];
    interRotaryBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    interRotaryBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    [interRotaryBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    
    UIImageView *arrow1ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(293.75f, 110.0f, 12.0f, 18.5f)];
    UIImage *arrow1Img=[UIImage imageNamed:@"knowledge_arrow.png"];
    arrow1ImgView.image=arrow1Img;
    
    
    UIImageView *line2ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 143.0f, 291.5f, 2.0f)];
    UIImage *line2Img=[UIImage imageNamed:@"knowledge_line.png"];
    line2ImgView.image=line2Img;

    UIButton *rotaryOrganizationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [rotaryOrganizationBtn setFrame:CGRectMake(0.0f, 153.0f, 320.0f, 25.0f)];
    [rotaryOrganizationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rotaryOrganizationBtn setTitle:@"扶輪組織" forState:UIControlStateNormal];
    rotaryOrganizationBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    rotaryOrganizationBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    
    UIImageView *arrow2ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(293.75f, 153.0f, 12.0f, 18.5f)];
    UIImage *arrow2Img=[UIImage imageNamed:@"knowledge_arrow.png"];
    arrow2ImgView.image=arrow2Img;
    
    UIImageView *line3ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 186.0f, 291.5f, 2.0f)];
    UIImage *line3Img=[UIImage imageNamed:@"knowledge_line.png"];
    line3ImgView.image=line3Img;
    
    UIButton *testBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setFrame:CGRectMake(0.0f, 196.0f, 320.0f, 25.0f)];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn setTitle:@"四大考驗" forState:UIControlStateNormal];
    testBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    testBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);

    UIImageView *arrow3ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(293.75f, 196.0f, 12.0f, 18.5f)];
    UIImage *arrow3Img=[UIImage imageNamed:@"knowledge_arrow.png"];
    arrow3ImgView.image=arrow3Img;
    
    UIImageView *line4ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 229.0f, 291.5f, 2.0f)];
    UIImage *line4Img=[UIImage imageNamed:@"knowledge_line.png"];
    line4ImgView.image=line4Img;
    
    UIButton *committeeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [committeeBtn setFrame:CGRectMake(0.0f, 239.0f, 320.0f, 25.0f)];
    [committeeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [committeeBtn setTitle:@"五大委員會" forState:UIControlStateNormal];
    committeeBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    committeeBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    
    UIImageView *arrow4ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(293.75f, 239.0f, 12.0f, 18.5f)];
    UIImage *arrow4Img=[UIImage imageNamed:@"knowledge_arrow.png"];
    arrow4ImgView.image=arrow4Img;
    
    UIImageView *line5ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 272.0f, 291.5f, 2.0f)];
    UIImage *line5Img=[UIImage imageNamed:@"knowledge_line.png"];
    line5ImgView.image=line5Img;
    
    UIButton *responsibilityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [responsibilityBtn setFrame:CGRectMake(0.0f, 280.0f, 320.0f, 25.0f)];
    [responsibilityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [responsibilityBtn setTitle:@"社員的責任" forState:UIControlStateNormal];
    responsibilityBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    responsibilityBtn.contentEdgeInsets = UIEdgeInsetsMake(0.0f,20.0f, 0.0f, 0.0f);
    
    UIImageView *arrow5ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(293.75f, 280.0f, 12.0f, 18.5f)];
    UIImage *arrow5Img=[UIImage imageNamed:@"knowledge_arrow.png"];
    arrow5ImgView.image=arrow5Img;
    
    UIImageView *line6ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 313.0f, 291.5f, 2.0f)];
    UIImage *line6Img=[UIImage imageNamed:@"knowledge_line.png"];
    line6ImgView.image=line6Img;
    
    //设置responsibilityBtn的监听器
    [responsibilityBtn addTarget:self action:@selector(ResponsilibityBtnAction:) forControlEvents:UIControlEventTouchUpInside];

    [_knowledgeView addSubview:tradeMarkImgView];
    [_knowledgeView addSubview:interRotaryLab];
    [_knowledgeView addSubview:KnowledgeLab];
    
    [_knowledgeView addSubview:line1ImgView];
    [_knowledgeView addSubview:interRotaryBtn];
    [_knowledgeView addSubview:arrow1ImgView];
    [_knowledgeView addSubview:line2ImgView];
    [_knowledgeView addSubview:rotaryOrganizationBtn];
    [_knowledgeView addSubview:arrow2ImgView];
    [_knowledgeView addSubview:line3ImgView];
    [_knowledgeView addSubview:testBtn];
    [_knowledgeView addSubview:arrow3ImgView];
    [_knowledgeView addSubview:line4ImgView];
    [_knowledgeView addSubview:committeeBtn];
    [_knowledgeView addSubview:arrow4ImgView];
    [_knowledgeView addSubview:line5ImgView];
    [_knowledgeView addSubview:responsibilityBtn];
    [_knowledgeView addSubview:arrow5ImgView];
    [_knowledgeView addSubview:line6ImgView];
    
    [self.view addSubview:_knowledgeView];
}

- (void)setupResponsibilityView {
    [_backBtn setHidden:NO];
    [_earlierBtn setHidden:YES];
    [_lineImgView setHidden:NO];
    [_lineImgView2 setHidden:NO];
    _responsibilityView=[[UIView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    _masterLab.text =@"扶輪知識";
    
    _knowledgeView =[[UIView alloc]initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 328.0f)];
    
    
    UIImageView *tradeMarkImgView=[[UIImageView alloc]initWithFrame:CGRectMake(136.25f, 0.0f, 47.5f, 48.0f)];
    UIImage *tradeMarkImg=[UIImage imageNamed:@"knowledge_toplogo.png"];
    tradeMarkImgView.image=tradeMarkImg;
    
    UILabel *interRotaryLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 53.0f, 320.0f,15.0f)];
    interRotaryLab.text=@"國際扶輪";
    interRotaryLab.backgroundColor=[UIColor clearColor];
    interRotaryLab.textAlignment=UITextAlignmentCenter;
    [interRotaryLab setFont:[UIFont systemFontOfSize:12]];
    
    
    UILabel *KnowledgeLab=[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 75.0f, 320.0f, 15.0f)];
    KnowledgeLab.text=@"扶輪知識";
    KnowledgeLab.backgroundColor=[UIColor clearColor];
    KnowledgeLab.textAlignment=UITextAlignmentCenter;
    [KnowledgeLab setFont:[UIFont systemFontOfSize:15]];
    
    UIImageView *line1ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 100.0f, 291.5f, 1.0f)];
    UIImage *line1Img=[UIImage imageNamed:@"knowledge_line.png"];
    line1ImgView.image=line1Img;
    
//    UIImageView *topImgView=[[UIImageView alloc]initWithFrame:CGRectMake(110.0f, 0.0f, 100.0f, 60.0f)];
//    UIImage *topImg=[UIImage imageNamed:@"333.jpg"];
//    topImgView.image=topImg;
    
    UILabel *responsilibityLab=[[UILabel alloc]initWithFrame:CGRectMake(14.25f, 110.0f, 320.0f, 20.0f)];
    [responsilibityLab setText:@"社員的責任"];
    [responsilibityLab setBackgroundColor:[UIColor clearColor]];
    [responsilibityLab setTextAlignment:UITextAlignmentLeft];
    
    UIImageView *line2ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(14.25f, 140.0f, 291.5f, 1.0f)];
    UIImage *line2Img=[UIImage imageNamed:@"knowledge_line.png"];
    line2ImgView.image=line2Img;
    
    UILabel *naLab=[[UILabel alloc]initWithFrame:CGRectMake(14.25f, 150.0f, 320.0f, 20.0f)];
    [naLab setText:@"叙述叙述叙述叙述"];
    [naLab setBackgroundColor:[UIColor clearColor]];
    [naLab setFont:[UIFont systemFontOfSize:13.0f]];
    [naLab setTextAlignment:UITextAlignmentLeft];
    
    [_responsibilityView addSubview:KnowledgeLab];
    [_responsibilityView addSubview:interRotaryLab];
    [_responsibilityView addSubview:tradeMarkImgView];
    [_responsibilityView addSubview:line1ImgView];
    [_responsibilityView addSubview:responsilibityLab];
    [_responsibilityView addSubview:line2ImgView];
    [_responsibilityView addSubview:naLab];
    [self.view addSubview:_responsibilityView];
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
            [_themeView removeFromSuperview];
            ;
            break;
        case 3:
            [_historyView removeFromSuperview];
            ;
            break;
        case 4:
            [_knowledgeView removeFromSuperview];
            break;
        case 5:
            [_responsibilityView removeFromSuperview];
            break;
            
        default:
            break;
    }
}

- (void)setupLeftMenuButton{
    UIButton *leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    leftBtn.titleLabel.text =@"首頁";
    [leftBtn setBackgroundColor:[UIColor clearColor]];
    [leftBtn setImage:[UIImage imageNamed:@"inter_home.png"] forState:UIControlStateNormal];
    leftBtn.frame =CGRectMake(0.0f, 0.0f, 37.0f, 21.0f);
    [leftBtn addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarBtn =[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    [self.navigationItem setLeftBarButtonItem:leftBarBtn animated:YES];
}

- (void)setupMasterTableView {
    
    _masterHistory =[[UIView alloc]initWithFrame:CGRectMake(6.5f, 31.0f, 307.0f, 368.5f)];
    [_masterHistory setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"inter_hisBg"]]];
    
    UIButton *closeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setFrame:CGRectMake(260.0f, 32.0f, 29.0f, 29.0f)];
    [closeBtn setImage:[UIImage imageNamed:@"inter_close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *masterHistoryLabel =[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 46.0f, 307.0f, 26.0f)];
    masterHistoryLabel.text =@"歷屆扶輪社長";
    masterHistoryLabel.textAlignment =UITextAlignmentCenter;
    [masterHistoryLabel setBackgroundColor:[UIColor clearColor]];
    masterHistoryLabel.font =[UIFont systemFontOfSize:18.0f];
    
    UIImageView *masterHistoryImage =[[UIImageView alloc]initWithFrame:CGRectMake(26.0f, 68.0f, 255.0f, 9.0f)];
    masterHistoryImage.image =[UIImage imageNamed:@"inter_hisLine.png"];
    
    UITableView *masterHistoryTable =[[UITableView alloc]init];
    [masterHistoryTable setFrame:CGRectMake(2.0f, 75.0f, 300.0f, 293.5f)];
    [masterHistoryTable setBackgroundColor:[UIColor clearColor]];
    masterHistoryTable.delegate =self;
    masterHistoryTable.dataSource =self;
    
    [masterHistoryTable reloadData];
    [_masterHistory addSubview:masterHistoryImage];
    [_masterHistory addSubview:masterHistoryLabel];
    [_masterHistory addSubview:masterHistoryTable];
    [_masterHistory addSubview:closeBtn];
    [self.view addSubview:_masterHistory];
    
    _earlierBtn.userInteractionEnabled =NO;
    _riMasterBtn.userInteractionEnabled =NO;
    _themeBtn.userInteractionEnabled =NO;
    _historyBtn.userInteractionEnabled =NO;
    _knowledgeBtn.userInteractionEnabled =NO;
}


- (void)setupThemeTableView {
    _masterHistory =[[UIView alloc]initWithFrame:CGRectMake(6.5f, 31.0f, 307.0f, 368.5f)];
    [_masterHistory setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"inter_hisBg"]]];
    
    UIButton *closeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setFrame:CGRectMake(260.0f, 32.0f, 29.0f, 29.0f)];
    [closeBtn setImage:[UIImage imageNamed:@"inter_close.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *masterHistoryLabel =[[UILabel alloc]initWithFrame:CGRectMake(0.0f, 46.0f, 307.0f, 26.0f)];
    masterHistoryLabel.text =@"歷屆年度主題";
    masterHistoryLabel.textAlignment =UITextAlignmentCenter;
    [masterHistoryLabel setBackgroundColor:[UIColor clearColor]];
    masterHistoryLabel.font =[UIFont systemFontOfSize:18.0f];
    
    UIImageView *masterHistoryImage =[[UIImageView alloc]initWithFrame:CGRectMake(26.0f, 68.0f, 255.0f, 9.0f)];
    masterHistoryImage.image =[UIImage imageNamed:@"inter_hisLine.png"];
    
    UITableView *masterHistoryTable =[[UITableView alloc]init];
    [masterHistoryTable setFrame:CGRectMake(2.0f, 75.0f, 300.0f, 293.5f)];
    [masterHistoryTable setBackgroundColor:[UIColor clearColor]];
    masterHistoryTable.delegate =self;
    masterHistoryTable.dataSource =self;
    
    [masterHistoryTable reloadData];
    [_masterHistory addSubview:masterHistoryImage];
    [_masterHistory addSubview:masterHistoryLabel];
    [_masterHistory addSubview:masterHistoryTable];
    [_masterHistory addSubview:closeBtn];
    [self.view addSubview:_masterHistory];
    
    _earlierBtn.userInteractionEnabled =NO;
    _riMasterBtn.userInteractionEnabled =NO;
    _themeBtn.userInteractionEnabled =NO;
    _historyBtn.userInteractionEnabled =NO;
    _knowledgeBtn.userInteractionEnabled =NO;
}

#pragma mark - button action

//naviBar Action
-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)historyBtnPressed :(id)sender {
    switch (_btnTag) {
        case 1:
            [self setupMasterTableView];
            break;
        case 2:
            [self setupThemeTableView];
            break;
        default:
            break;
    }
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
        [self removeViewFromSuperView];
        [self setupThemeView];
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
        [self removeViewFromSuperView];
        [self setupHistoryView];
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

- (void)ResponsilibityBtnAction :(id)sender{
    [self removeViewFromSuperView];
    [self setupResponsibilityView];
    _btnTag =5;
}

- (void)closeBtnPressed :(id)sender {
//    if (_btnTag ==1) {
        [_masterHistory removeFromSuperview];
//    }
    
    _earlierBtn.userInteractionEnabled =YES;
    _riMasterBtn.userInteractionEnabled =YES;
    _themeBtn.userInteractionEnabled =YES;
    _historyBtn.userInteractionEnabled =YES;
    _knowledgeBtn.userInteractionEnabled =YES;
}

#pragma mark - setup tableview

// 共有一个section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 1个section有6个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (_btnTag) {
        case 1:
            return 108.0f;
            break;
        case 2:
            return 108.0f;
            break;
        case 3:
            return 100.0f;
            break;
        default:
            return 0.0f;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier =@"Cell";
    if (_btnTag ==3) {
        RotaryHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:  CellIdentifier];
        if (cell == nil) {
            NSArray *xib=[[NSBundle mainBundle] loadNibNamed:@"RotaryHistoryCell" owner:self options:nil];
            cell =(RotaryHistoryCell *)[xib objectAtIndex:0];
        }
        [cell.RotaryHistoryCellTopTextView setEditable:NO];
        [cell.RotaryHistoryCellBottomTextView setEditable:NO];
        int i=indexPath.row%2;
        
        if (i ==0) {
            cell.RotaryHistoryCellLab.text=@"1905";
            cell.RotaryHistoryCellTopTextView.text=@"1.第一個扶輪社在美國醫科羅州芝加哥成立";
            cell.RotaryHistoryCellBottomTextView.text=@"成立扶少圈";
        }else {
            cell.RotaryHistoryCellLab.text=@"1995";
            cell.RotaryHistoryCellTopTextView.text=@"1.第一個扶輪社在美國醫科羅州芝加哥成立";
            cell.RotaryHistoryCellBottomTextView.text=@"成立扶少圈";
        }
        
        return cell;
    } else if (_btnTag ==2){
        RotaryThemeHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:  CellIdentifier];
        if (cell == nil) {
            NSArray *xib=[[NSBundle mainBundle] loadNibNamed:@"RotaryThemeHistoryCell" owner:self options:nil];
            cell =(RotaryThemeHistoryCell *)[xib objectAtIndex:0];
        }
        [cell.themeBtn setImage:[UIImage imageNamed:@"inter_detailBtn.png"] forState:UIControlStateNormal];
        return cell;
    }else {
        RotaryMasterHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:  CellIdentifier];
        if (cell == nil) {
            NSArray *xib=[[NSBundle mainBundle] loadNibNamed:@"RotaryMasterHistoryCell" owner:self options:nil];
            cell =(RotaryMasterHistoryCell *)[xib objectAtIndex:0];
        }
        [cell.detailBtn setImage:[UIImage imageNamed:@"inter_detailBtn.png"] forState:UIControlStateNormal];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
@end
