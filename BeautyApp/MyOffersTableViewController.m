//
//  MyOffersTableViewController.m
//  BeautyApp
//
//  Created by 5399 on 20/2/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "MyOffersTableViewController.h"
#import "MyOffersDetailViewController.h"
#import "LoginViewController.h"

@interface MyOffersTableViewController ()

@end

@implementation MyOffersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *userEmail = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserEmail"];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserOffers"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@", userEmail]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _myOffers = [[NSMutableArray alloc] init];
    _myOffers = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *userEmail = [[NSUserDefaults standardUserDefaults] valueForKey:@"UserEmail"];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"UserOffers"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"email == %@", userEmail]];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _myOffers = [[NSMutableArray alloc] init];
    _myOffers = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_myOffers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerNib:[UINib nibWithNibName:@"MyOfferCell" bundle:nil] forCellReuseIdentifier:@"MyOffersCell"];
    
    MyOfferCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyOffersCell" forIndexPath:indexPath];
    
    NSManagedObject *offer = [_myOffers objectAtIndex:indexPath.row];
    
    UIImage *img = [UIImage imageNamed: [offer valueForKeyPath:@"offerImage"]];
    [cell.imageView setImage:img];
    [cell.titleLbl setText:[offer valueForKeyPath:@"offerTitle"]];
    [cell.descriptionLbl setText:[offer valueForKeyPath:@"offerInformation"]];
    
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showMyOfferDetail" sender:indexPath];
    return indexPath;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showMyOfferDetail"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        
        NSData *object = [_myOffers objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] setMyOfferDetailData:object];
        
    }
}

- (IBAction)Logout:(id)sender{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"UserEmail"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:loginViewController animated:YES];
    
    //UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //[self.navigationController pushViewController:vc animeted:YES];
}

@end