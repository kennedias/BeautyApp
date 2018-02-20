//
//  LoginViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "LoginViewController.h"
#import "OffersTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize tbxEmail, tbxPassword, lblSystemMessage;

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

- (IBAction)Login:(id)sender {
        
    NSString *emailRegexExpression = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegexExpression];
    BOOL isEmailValid = [emailValidation evaluateWithObject:[tbxEmail text]];
    [lblSystemMessage setText:@""];
    
    if (isEmailValid){
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@", [tbxEmail text]]];
        
        NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
        
        NSMutableArray *_users = [[NSMutableArray alloc] init];
        _users = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
        
        if ([_users count]){
            NSManagedObject *user = _users[0];
            BOOL isPasswordAndConfirmation = [[tbxPassword text] isEqualToString:[user valueForKeyPath:@"password"]];
            
            if(isPasswordAndConfirmation){
                [[NSUserDefaults standardUserDefaults] setObject:[tbxEmail text] forKey:@"UserEmail"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
                appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];                
            }else{
                [lblSystemMessage setText:@"Invalid password."];
            }
        }else {
            [lblSystemMessage setText:@"Invalid user."];
        }
    } else {
        [lblSystemMessage setText:@"Invalid email."];
    }
}

@end
