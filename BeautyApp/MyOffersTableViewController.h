//
//  MyOffersTableViewController.h
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OfferCell.h"
#import "AppDelegate.h"
@import CoreData;

@interface MyOffersTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_myOffers;
    NSManagedObjectContext *_managedContext;
}
- (IBAction)Logout:(id)sender;

@end
