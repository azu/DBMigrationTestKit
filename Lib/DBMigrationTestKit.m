//
// Created by azu on 2014/03/27.
//


#import "DBMigrationTestKit.h"


@interface DBMigrationTestKit ()
@property(nonatomic, strong) NSURL *tempDirectory;
@end

@implementation DBMigrationTestKit {

}

- (void)setupCoreDataStackWithAutoMigratingSQLiteName:(NSString *) name momdName:(NSString *) momdName {
    self.tempDirectory = [self temporaryRandomURL];
    self.storeURL = [self copyStoreWithName:name toURL:self.tempDirectory];
    NSURL *momURL = [[NSBundle mainBundle] URLForResource:momdName withExtension:@"momd"];
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momURL];
    // SQLite
    NSString *storeType = NSSQLiteStoreType;
    NSDictionary *options = @{
        NSMigratePersistentStoresAutomaticallyOption : @YES,
        NSInferMappingModelAutomaticallyOption : @YES
    };
    NSError *persistentStoreCoordinatorError = nil;
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    [self.persistentStoreCoordinator addPersistentStoreWithType:storeType
                                     configuration:nil
                                     URL:self.storeURL
                                     options:options
                                     error:&persistentStoreCoordinatorError];
    if (persistentStoreCoordinatorError) {
        NSLog(@"NSPersistentStoreCoordinatorError = %@",
            [persistentStoreCoordinatorError description]);
    }
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
}

- (NSURL *)temporaryRandomURL {
    NSString *uniqueName = [[NSProcessInfo processInfo].globallyUniqueString stringByAppendingString:@"/"];
    return [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:uniqueName]];
}

- (NSURL *)copyStoreWithName:(NSString *) name toURL:(NSURL *) url {
    // Create a unique url every test so migration always runs
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:[name stringByDeletingPathExtension] ofType:name.pathExtension];
    NSString *directoryPath = [path stringByDeletingLastPathComponent];
    NSFileManager *fileManager = [NSFileManager new];
    NSError *error = nil;
    [fileManager copyItemAtPath:directoryPath
                 toPath:url.path error:&error];
    NSAssert(error == nil, @"CopyError %@", error);
    return [url URLByAppendingPathComponent:name];
}

- (void)cleanup {
    NSFileManager *fileManager = [NSFileManager new];
    if ([fileManager fileExistsAtPath:self.tempDirectory.path]) {
        NSError *error = nil;
        [fileManager removeItemAtURL:self.tempDirectory error:&error];
        NSAssert(error == nil, @"RemoveError %@", error);
    }
    self.tempDirectory = nil;
}
@end