//
//  SignUpViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize tbxEmail, tbxPassword, tbxConfirmPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)SignUp:(id)sender {
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    
    [user setValue:[tbxEmail text] forKey:@"email"];
    [user setValue:[tbxPassword text] forKey:@"password"];
    
    NSError *error = nil;
    
    [context save:&error];
    
    if (error != nil) {
        NSLog(@"Error during insert %@ %@", error, [error localizedDescription]);
    } else {
        NSLog(@"User inserted!");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
