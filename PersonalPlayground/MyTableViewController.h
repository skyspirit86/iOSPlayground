//
//  MyTableViewController.h
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/5/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "SourcesData.h"

@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *json;
@property (nonatomic, strong) NSMutableArray *sourcesArray;
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

#pragma mark - Methods 

- (void) retrieveData;
- (NSURLSession*) getURLSession;

@end
