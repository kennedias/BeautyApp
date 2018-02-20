//
//  OfferCell.m
//  BeautyApp
//
//  Created by 5399 on 21/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "MyOfferCell.h"

@implementation MyOfferCell

@synthesize imageView, titleLbl, descriptionLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
