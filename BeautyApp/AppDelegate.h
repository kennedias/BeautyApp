//
//  AppDelegate.h
//  BeautyApp
//
//  Created by 5399 on 15/1/18.
//  Copyright © 2018 5399. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, retain) UINavigationController *navController;

- (void)saveContext;

@end

