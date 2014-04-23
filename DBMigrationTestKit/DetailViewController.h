//
//  DetailViewController.h
//  DBMigrationTestKit
//
//  Created by azu on 2014/04/23.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end