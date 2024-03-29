//
//  OfferDetailViewController.m
//  BeautyApp
//
//  Created by 5399 on 8/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "OfferDetailViewController.h"

@interface OfferDetailViewController ()

@end

@implementation OfferDetailViewController

@synthesize titleLbl, descriptionLbl, imageView;

- (void)setOfferDetailData:(id)newOfferDetailData {
    _offerDetailData = newOfferDetailData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[lblDetail setText:[_detailData description]];
    
    UIImage *img = [UIImage imageNamed: [_offerDetailData OfferImage]];
    
    [imageView setImage:img];
    [titleLbl setText:[_offerDetailData OfferTitle]];
    [descriptionLbl setText:[_offerDetailData OfferDescription]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
