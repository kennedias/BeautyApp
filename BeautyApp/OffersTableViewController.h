//
//  OffersTableViewController.h
//  BeautyApp
//
//  Created by Tawny Almeida on 23/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OffersCell.h"

@interface OffersTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *titles;
    NSArray *descriptions;
    NSArray *images;
}
@end

