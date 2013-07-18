//
//  RotaryMasterHistoryCell.h
//  Rotary
//
//  Created by Evan on 13-7-18.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotaryMasterHistoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;

- (IBAction)deailBtnPressed:(id)sender;
@end
