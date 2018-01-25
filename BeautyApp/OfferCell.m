//
//  OfferCell.m
//  BeautyApp
//
//  Created by 5399 on 25/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "OfferCell.h"

@implementation OfferCell

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
