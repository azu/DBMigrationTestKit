//
// Created by azu on 2014/03/27.
//


#import <Foundation/Foundation.h>

@interface DBMigrationTestKit : NSObject
@property(nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic, strong) NSURL *storeURL;

/*
    Copy SQLite file + setup + migration

    name: SQLite file name
    momdName: momd file name
        - the same name as xcdatamodeld file name
 */
- (void)setupCoreDataStackWithAutoMigratingSQLiteName:(NSString *) name momdName:(NSString *) momdName;

/*
    Remove copied SQLite file
 */
- (void)cleanup;
@end