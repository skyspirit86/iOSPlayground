//
//  MyTableViewController.h
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/5/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface MyTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *tableData;

@end
