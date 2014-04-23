//
//  DBMigrationTestKitTests.m
//  DBMigrationTestKitTests
//
//  Created by azu on 2014/04/23.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DBMigrationTestKit.h"

@interface DBMigrationTestKitTests : XCTestCase

@end

@implementation DBMigrationTestKitTests {
    DBMigrationTestKit *migrationTestKit;
}

- (void)setUp {
    [super setUp];
    migrationTestKit = [[DBMigrationTestKit alloc] init];
    [migrationTestKit setupCoreDataStackWithAutoMigratingSQLiteName:@"DBMigrationTestKit" momdName:@"DBMigrationTestKit"];
}

- (void)tearDown {
    [migrationTestKit cleanup];
    [super tearDown];
}

- (void)testMigration {
    // assert migration results
}

@end
