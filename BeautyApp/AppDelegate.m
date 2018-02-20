//
//  AppDelegate.m
//  BeautyApp
//
//  Created by 5399 on 15/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /* INSERT DATA - Use for data generate */
   // UIViewController* rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"CreateDataViewController"];
    self.generateData;
    
    UIViewController* rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
    
    self.window.rootViewController = navigation;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BeautyModel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)generateData {

    NSManagedObjectContext *context = [[[[UIApplication sharedApplication] delegate] performSelector:@selector(persistentContainer)] viewContext];
    
    //Verify if there is a user with the email provided
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Offer"];
    
    NSMutableArray *_offers = [[NSMutableArray alloc] init];
    _offers = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    //If the offer is already inserted for the email it will no be inserted again.
    if (![_offers count]){
        NSManagedObject *offer = [NSEntityDescription insertNewObjectForEntityForName:@"Offer" inManagedObjectContext:context];
        
        [offer setValue:@"Hair" forKey:@"title"];
        [offer setValue:@"Your hair will be done carefully!" forKey:@"information"];
        [offer setValue:@"beauti_ico" forKey:@"image"];
        
        NSManagedObject *offer2 = [NSEntityDescription insertNewObjectForEntityForName:@"Offer" inManagedObjectContext:context];
        
        [offer2 setValue:@"Beaty Nails" forKey:@"title"];
        [offer2 setValue:@"Change your favorite color and style.!" forKey:@"information"];
        [offer2 setValue:@"beauti_ico" forKey:@"image"];
        
        NSManagedObject *offer3 = [NSEntityDescription insertNewObjectForEntityForName:@"Offer" inManagedObjectContext:context];
        
        [offer3 setValue:@"Brazilian Wax" forKey:@"title"];
        [offer3 setValue:@"The most wanted wax method now with a special price.!" forKey:@"information"];
        [offer3 setValue:@"beauti_ico" forKey:@"image"];
        
        NSManagedObject *offer4 = [NSEntityDescription insertNewObjectForEntityForName:@"Offer" inManagedObjectContext:context];
        
        [offer4 setValue:@"Skin Flower" forKey:@"title"];
        [offer4 setValue:@"Your skin soft as a rose!" forKey:@"information"];
        [offer4 setValue:@"beauti_ico" forKey:@"image"];
        
        NSError *error = nil;
        
        [context save:&error];
        
        if (error != nil) {
            NSLog(@"Error during insert %@ %@", error, [error localizedDescription]);
        } else {
            NSLog(@"Data created! ");
        }
        
    }
}

@end
