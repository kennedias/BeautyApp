//
//  OffersTableViewController.h
//  BeautyApp
//
//  Created by 5399 on 23/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferCell.h"
#import "AppDelegate.h"
@import CoreData;

@interface OffersTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_offers;
    NSManagedObjectContext *_managedContext;
}
- (IBAction)Logout:(id)sender;


@end

