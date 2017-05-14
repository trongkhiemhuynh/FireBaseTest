//
//  ViewController.m
//  C2 Champion 2017
//
//  Created by Khiem T. Huynh on 5/14/17.
//  Copyright © 2017 HTK. All rights reserved.
//

#import "ViewController.h"
#import "C2TableViewCell.h"

@import FirebaseDatabase;

@import FirebaseAuth;

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UITableView *tbvFinalC2;

@property (strong, nonatomic) NSMutableDictionary *dict;
@property (strong, nonatomic) NSMutableArray *dataList;

//@property (strong, nonatomic) SVProgressHUD *svProgressHUD;

@end

@implementation ViewController

@synthesize dataList,dict;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = self.typeSoccer;
    
    dict = [NSMutableDictionary dictionary];
    
    dataList = [NSMutableArray array];
    
    self.ref = [[FIRDatabase database] reference];
    
    [SVProgressHUD show];
    
    if ([self.typeSoccer isEqualToString:@"premier_league"]) {
        [self loadDataFirebase:@"round_36"];
    } else if ([self.typeSoccer isEqualToString:@"champion_league"]) {
        [self loadDataFirebase:@"final"];
    } else {
        [self loadDataFirebase:@"final"];
    }
    
    
}

- (void)loadDataFirebase:(NSString *)round {
    [self.ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        [SVProgressHUD dismiss];
        
        NSLog(@"aaaa %@",snapshot.value);
        
        dict = snapshot.value;
        
        NSDictionary *dictType;
        NSDictionary *dictRound;
        NSArray *arrMatch;
        
        dictType = dict[self.typeSoccer];
        
        dictRound = dictType[round];
        
        arrMatch = dictRound[@"match"];
        
        
        for (NSDictionary *dict1 in arrMatch) {
            MatchModel *mm = [MatchModel new];
            
            ClubModel *cm1 = [ClubModel new];
            ClubModel *cm2 = [ClubModel new];
            
            NSDictionary *team1 = dict1[@"team_1"];
            
            cm1.flagUrl = team1[@"flagClub"];
            cm1.clubName = team1[@"nameClub"];
            cm1.scoreMatch = team1[@"scoreClub"];
            
            NSDictionary *team2 = dict1[@"team_2"];
            
            cm2.flagUrl = team2[@"flagClub"];
            cm2.clubName = team2[@"nameClub"];
            cm2.scoreMatch = team2[@"scoreClub"];
            
            mm.team1 = cm1;
            
            mm.team2 = cm2;
            
            mm.timeHappen = dict1[@"timePlay"];
            
            [dataList addObject:mm];
        }
        
        [self.tbvFinalC2 reloadData];
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"C2Cell";
    
    C2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[C2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    
    MatchModel *mm = [dataList objectAtIndex:indexPath.section];
    
    [cell setDataCell:mm];
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, 200, 30)];
    lbl.textColor = [UIColor whiteColor];
    
    lbl.text = [NSString stringWithFormat:@"MATCH %ld",section + 1];
    
    UIView *view = [[UIView alloc] initWithFrame:[tableView.tableHeaderView bounds]];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    
    if ([self.typeSoccer isEqualToString:@"premier_league"]) {
        imgView.image = [UIImage imageNamed:@"premier_league"];
    } else if ([self.typeSoccer isEqualToString:@"champion_league"]) {
        imgView.image = [UIImage imageNamed:@"champion_league"];
    } else {
        imgView.image = [UIImage imageNamed:@"europa_league"];
    }
    
    view.backgroundColor = [UIColor lightGrayColor];
    
    [view addSubview:imgView];
    [view addSubview:lbl];
    
    
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
