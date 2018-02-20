

#import "OffersTableViewController.h"
#import "OfferVO.h"
#import "OfferDetailViewController.h"
#import "OfferCell.h"

@interface OffersTableViewController (){
   // NSArray *offers;
}

@end

@implementation OffersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _offers = [[NSMutableArray alloc] init];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Offer"];
    
    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    _offers = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
  
  /*  titles = [[NSArray alloc]initWithObjects:@"Clear Skin", @"Hair", @"Beaty Nails", @"Brazilian Wax", nil];
    descriptions = [[NSArray alloc]initWithObjects:
                    @"The best treatment for your skin!",
                    @"Your hair will be done carefully",
                    @"Change your favorite color and style.",
                    @"The most wanted wax method now with a special price.", nil];
    //UIImage *imageIco = [UIImage imageNamed:@"beauti_ico"];
    images = [[NSArray alloc]initWithObjects: @"beauti_ico", @"beauti_ico", @"beauti_ico", @"beauti_ico", nil];
    */

    NSLog(@"%@", _offers);
    
    
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
    
    return [_offers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerNib:[UINib nibWithNibName:@"OfferCell" bundle:nil] forCellReuseIdentifier:@"OffersCell"];
    
    OfferCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OffersCell" forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.imageView.image = [UIImage imageNamed:@"beauti_ico"];
    //cell.textLabel.text = offers[indexPath.row];
    //[cell.titleLbl setText:[titles objectAtIndex:indexPath.row]];
    //[cell.descriptionLbl setText:[descriptions objectAtIndex:indexPath.row]];
    
    //UIImage *img = [UIImage imageNamed:@"beauti_ico"];
    
    //[cell.imageView setImage:img];
    
    //[cell updateCellWithTitle:[titles objectAtIndex:indexPath.row] description:[descriptions objectAtIndex:indexPath.row] image:[images objectAtIndex:indexPath.row]];
    
    NSManagedObject *offer = [_offers objectAtIndex:indexPath.row];   
   
    UIImage *img = [UIImage imageNamed: [offer valueForKeyPath:@"image"]]];
    [cell.imageView setImage:img];
    [cell.titleLbl setText:[offer valueForKeyPath:@"title"]]];
    [cell.descriptionLbl setText:[offer valueForKeyPath:@"information"]]];
    
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showOfferDetail" sender:indexPath];
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
    if ([[segue identifier] isEqualToString:@"showOfferDetail"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        
        NSData *object = [_offers objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] setOfferDetailData:object];
        
    }
}


@end
