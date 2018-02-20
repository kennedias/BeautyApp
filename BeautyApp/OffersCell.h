//
//  OffersCell.h
//  BeautyApp
//
//  Created by 5399 on 23/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersCell : UITableViewCell
@property(nonnull,strong) IBOutlet UIImageView *imageView;
@property(nonnull,strong) IBOutlet UILabel *titleLbl;
@property(nonnull,strong) IBOutlet UILabel *descriptionLbl;

-(void)updateCellWithTitle:(nonnull NSString *)title
               description:(nonnull NSString *)description
                     image:(nonnull NSString *)image;

@end
