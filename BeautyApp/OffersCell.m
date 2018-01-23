//
//  OffersCell.m
//  BeautyApp
//
//  Created by Tawny Almeida on 23/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "OffersCell.h"

@implementation OffersCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)updateCellWithTitle:(NSString *)title description:(NSString *)description image:(NSString *) image{
    self.imageView.image = [UIImage imageNamed:image];
    self.titleLbl.text = title;
    self.descriptionLbl.text = description;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
