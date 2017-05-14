//
//  C2TableViewCell.h
//  C2 Champion 2017
//
//  Created by Khiem T. Huynh on 5/14/17.
//  Copyright © 2017 HTK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface C2TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *clubName1;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UILabel *clubName2;
@property (weak, nonatomic) IBOutlet UIImageView *imgClub2;
@property (weak, nonatomic) IBOutlet UIImageView *imgClub1;
@property (weak, nonatomic) IBOutlet UILabel *timeHappend;


- (void)setDataCell:(MatchModel *)mm;
@end
