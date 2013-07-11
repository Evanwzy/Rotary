//
//  RotaryHomeViewController.h
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotaryHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *InfoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *img_1;


- (IBAction)homeBtnPressed:(UIButton *)sender;

@end
