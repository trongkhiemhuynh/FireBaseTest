//
//  BaseViewController.m
//  C2 Champion 2017
//
//  Created by Khiem T. Huynh on 5/14/17.
//  Copyright © 2017 HTK. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ViewController *vc = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"premier_league"]) {
        vc.typeSoccer = @"premier_league";
        
    } else if ([segue.identifier isEqualToString:@"champion_league"]) {
        vc.typeSoccer = @"champion_league";
    } else {
        vc.typeSoccer = @"europa_league";
    }
    
    
    
}


@end
