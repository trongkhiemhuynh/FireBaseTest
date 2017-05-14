//
//  PremierLeageModel.h
//  C2 Champion 2017
//
//  Created by Khiem T. Huynh on 5/14/17.
//  Copyright © 2017 HTK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClubModel.h"

@interface MatchModel : NSObject

@property (strong, nonatomic) ClubModel *team1;
@property (strong, nonatomic) ClubModel *team2;

@property (strong, nonatomic) NSString *timeHappen;

@end
