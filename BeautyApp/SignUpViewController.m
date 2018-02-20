//
//  SignUpViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "SignUpViewController.h"
#import "LoginViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize tbxEmail, tbxPassword, tbxConfirmPassword, lblSystemMessage;

- (void)viewDidLoad {
    [super viewDidLoad];
    [lblSystemMessage setText:@""];
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
    
    NSString *emailRegexExpression = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegexExpression];
    BOOL isEmailValid = [emailValidation evaluateWithObject:[tbxEmail text]];
    
    if (isEmailValid){
        [lblSystemMessage setText:@""];
        BOOL isPasswordAndConfirmation = [[tbxPassword text] isEqualToString:[tbxConfirmPassword text]];
        
        if (isPasswordAndConfirmation){
            
            //Verify if there is a user with the email provided
            NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@", [tbxEmail text]]];
            NSMutableArray *_users = [[NSMutableArray alloc] init];
            _users = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
            
            //If the email is already inserted, the user needs to inform a different one to create an account.
            if (![_users count]){
                [user setValue:[tbxEmail text] forKey:@"email"];
                [user setValue:[tbxPassword text] forKey:@"password"];
                
                NSError *error = nil;
                
                [context save:&error];
                
                if (error != nil) {
                    NSLog(@"Error during insert %@ %@", error, [error localizedDescription]);
                } else {
                    [[NSUserDefaults standardUserDefaults] setObject:[tbxEmail text] forKey:@"UserEmail"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
                    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController]; 
                }
            } else {
                [lblSystemMessage setText:@"Email already in use. Try a new one."];
            }

        } else {
            [lblSystemMessage setText:@"Password and Password Confirmation must to match."];
        }
    } else {
        [lblSystemMessage setText:@"Invalid email"];
    }
}


@end
