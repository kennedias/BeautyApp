//
//  LoginViewController.h
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@import CoreData;

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tbxEmail;
@property (weak, nonatomic) IBOutlet UITextField *tbxPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblSystemMessage;

- (IBAction)Login:(id)sender;

@end
