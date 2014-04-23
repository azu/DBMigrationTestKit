# DBMigrationTestKit

CoreData Migration testing library.

- main purpose is testing migration used by `NSEntityMigrationPolicy`.

## Installation

```sh
pod 'DBMigrationTestKit'
```

## Usage

``` objc
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
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT