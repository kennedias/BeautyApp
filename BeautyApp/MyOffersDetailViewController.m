//
//  MyOffersDetailViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "MyOffersDetailViewController.h"

@interface MyOffersDetailViewController ()

@end

@implementation MyOffersDetailViewController

@synthesize titleLbl, informationLbl, imageView;

- (void)setMyOfferDetailData:(id)newMyOfferDetailData {
    _myOfferDetailData = newMyOfferDetailData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [titleLbl setText:[_myOfferDetailData valueForKeyPath:@"title"]];
    [informationLbl setText:[_myOfferDetailData valueForKeyPath:@"information"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeOffer:(id)sender{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
