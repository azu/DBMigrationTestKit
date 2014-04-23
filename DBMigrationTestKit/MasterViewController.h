//
//  MasterViewController.h
//  DBMigrationTestKit
//
//  Created by azu on 2014/04/23.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end