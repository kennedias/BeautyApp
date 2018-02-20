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

@synthesize titleLbl, informationLbl, imageView;

- (void)setOfferDetailData:(id)newOfferDetailData {
    _offerDetailData = newOfferDetailData;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [titleLbl setText:[_offerDetailData valueForKeyPath:@"title"]];
    [informationLbl setText:[_offerDetailData valueForKeyPath:@"information"]];
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

- (IBAction)addOffer:(id)sender{
    NSString *userEmail = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserEmail"];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSManagedObject *userOffers = [NSEntityDescription insertNewObjectForEntityForName:@"UserOffers" inManagedObjectContext:context];
    
    //Verify if there is a user with the email provided
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserOffers"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@ AND offerTitle ==%@", userEmail, [titleLbl text]]];
    NSMutableArray *_users = [[NSMutableArray alloc] init];
    _users = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    //If the email is already inserted, the user needs to inform a different one to create an account.
    if (![_users count]){
        [userOffers setValue:userEmail forKey:@"email"];
        [userOffers setValue:[titleLbl text] forKey:@"offerTitle"];
        [userOffers setValue:[informationLbl text] forKey:@"offerInformation"];
        [userOffers setValue:@"beauti_ico" forKey:@"offerImage"];
        
        NSError *error = nil;
        
        [context save:&error];
        
        if (error != nil) {
            NSLog(@"Error during insert %@ %@", error, [error localizedDescription]);
        }else {
            
        }
    }
}

@end
