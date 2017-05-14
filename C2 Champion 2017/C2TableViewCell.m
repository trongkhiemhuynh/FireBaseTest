//
//  C2TableViewCell.m
//  C2 Champion 2017
//
//  Created by Khiem T. Huynh on 5/14/17.
//  Copyright © 2017 HTK. All rights reserved.
//

#import "C2TableViewCell.h"

@implementation C2TableViewCell

@synthesize clubName1,clubName2,score1,score2,imgClub1,imgClub2,timeHappend;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataCell:(MatchModel *)mm {
    clubName1.text = mm.team1.clubName;
    clubName2.text = mm.team2.clubName;
    
    score1.text = mm.team1.scoreMatch;
    score2.text = mm.team2.scoreMatch;
    
    timeHappend.text = mm.timeHappen;
    
    [imgClub1 sd_setImageWithURL:[NSURL URLWithString:mm.team1.flagUrl]];
    
    [imgClub2 sd_setImageWithURL:[NSURL URLWithString:mm.team2.flagUrl]];
}

@end
