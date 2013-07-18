//
//  RotaryThemeHistoryCell.h
//  Rotary
//
//  Created by Evan on 13-7-18.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotaryThemeHistoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *themeBtn;

- (IBAction)themeBtnPressed:(id)sender;
@end
