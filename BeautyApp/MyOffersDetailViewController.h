//
//  MyOffersDetailViewController.h
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

@interface MyOffersDetailViewController : UIViewController

@property (strong, nonatomic) id myOfferDetailData;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *informationLbl;

- (IBAction)removeOffer:(id)sender;
@end
