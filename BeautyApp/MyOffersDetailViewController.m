//
//  MyOffersDetailViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "MyOffersDetailViewController.h"

@interface MyOffersDetailViewController ()

@end

@implementation MyOffersDetailViewController

@synthesize titleLbl, informationLbl, imageView;

- (void)setMyOfferDetailData:(id)newMyOfferDetailData {
    _myOfferDetailData = newMyOfferDetailData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [titleLbl setText:[_myOfferDetailData valueForKeyPath:@"offerTitle"]];
    [informationLbl setText:[_myOfferDetailData valueForKeyPath:@"offerInformation"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)removeOffer:(id)sender{
    
    NSString *alertTitle;
    NSString *alertMessage;
    NSString *userEmail = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserEmail"];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserOffers"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@ AND offerTitle == %@", userEmail, [titleLbl text]]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSMutableArray *_myOffers = [[NSMutableArray alloc] init];
    _myOffers = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    NSError *error;
    NSArray *offersToDelete = [context executeFetchRequest:fetchRequest error:&error];

    for (NSManagedObject *managedObject in offersToDelete)
    {
        [context deleteObject:managedObject];
        NSLog(@"Register deleted!");
    }

    if (error != nil) {
        NSLog(@"Error during delete %@ %@", error, [error localizedDescription]);
        alertTitle = @"Error";
        alertMessage = @"The offer could not be deleted.";
    }else {
       // NSLog(@"Register deleted!");
        alertTitle = @"Success";
        alertMessage = @"The offer have been deleted.";
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
                                                 style: UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                               }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
