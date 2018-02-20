//
//  CreateDataViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "CreateDataViewController.h"

@interface CreateDataViewController ()

@end

@implementation CreateDataViewController

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

- (IBAction)CreateData:(id)sender {
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    NSManagedObject *offer = [NSEntityDescription insertNewObjectForEntityForName:@"Offer" inManagedObjectContext:context];
    
    [offer setValue:@"Clear Skin X" forKey:@"title"];
    [offer setValue:@"The best treatment for your skinX!" forKey:@"information"];
    [offer setValue:@"beauti_ico" forKey:@"image"];
    
    NSError *error = nil;
    
    [context save:&error];
    
    if (error != nil) {
        NSLog(@"Error during insert %@ %@", error, [error localizedDescription]);
    } else {
        NSLog(@"Data created! ");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
