//
//  RotaryHomeViewController.h
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotaryNetworkingManager.h"

@interface RotaryHomeViewController : UIViewController <NetworkingRequestManagerTestDelegate,NetworkingRequestManagerFirstDelegate>

@property (weak, nonatomic) IBOutlet UIButton *InfoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *img_1;


- (IBAction)homeBtnPressed:(UIButton *)sender;
- (IBAction)testBtn:(id)sender;
- (IBAction)Btn3:(id)sender;

@end
