//
//  OfferDetailViewController.h
//  BeautyApp
//
//  Created by 5399 on 8/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferVO.h"

@interface OfferDetailViewController : UIViewController

@property (strong, nonatomic) id offerDetailData;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLbl;

@end
