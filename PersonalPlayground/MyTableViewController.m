//
//  MyTableViewController.m
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/5/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController () 

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Table View";
    
    // load data
    [self retrieveData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sourcesArray count];
    //return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    static NSString *cellId = @"customCellId";
    
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
//    built in table cell
//    cell.textLabel.text = self.tableData[indexPath.row];
//    cell.detailTextLabel.text = @"krco";
//    cell.imageView.image = [UIImage imageNamed:@"bg_test"];
    
    SourcesData *currentSourceData = [self.sourcesArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = currentSourceData.sourceName;
    cell.idLabel.text = currentSourceData.sourceId;
    cell.categoryLable.text = currentSourceData.sourceCategory;
    cell.urlLabel.text = currentSourceData.sourceURL;
    cell.languageLabel.text = currentSourceData.sourcelanguage;
    cell.descriptionTextView.text = currentSourceData.sourceDescription;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *rowValue = self.sourcesArray[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"Selected row: %@", rowValue];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row selected!" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) retrieveData {
    // REST API endpoint
    NSString *sourcesURL = @"https://newsapi.org/v1/sources?language=en";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:sourcesURL]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // my code
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // if there is no data received
            if (!data) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"There is no data. Server is down or no wifi/network connection." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [alert show];
                return;
            }
            
            // json parsing from endpoint
            NSError *jsonError;
            self.json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            
            self.sourcesArray = [[NSMutableArray alloc] init];
            
            NSMutableArray *arr = [self.json valueForKey:@"sources"];
            
            for (int i = 0; i < [arr count]; i++) {
                NSString *sId = [[arr objectAtIndex:i] objectForKey:@"id"];
                NSString *sName = [[arr objectAtIndex:i] objectForKey:@"name"];
                NSString *sDescription = [[arr objectAtIndex:i] objectForKey:@"description"];
                NSString *sURL = [[arr objectAtIndex:i] objectForKey:@"url"];
                NSString *sCategory = [[arr objectAtIndex:i] objectForKey:@"category"];
                NSString *sLanguage = [[arr objectAtIndex:i] objectForKey:@"language"];
                NSString *sCountry = [[arr objectAtIndex:i] objectForKey:@"country"];
                
                SourcesData *sourceData = [[SourcesData alloc] initWithId:sId andName:sName andDesciption:sDescription andURL:sURL andCategory:sCategory andLanguage:sLanguage andCountry:sCountry];
                
                [self.sourcesArray addObject:sourceData];
            }
            
            [self.mainTableView reloadData];
            
            /*
            if (self.sources) {
                // NSLog(@"Data: %@", self.tableDataDic);
                for (id item in [self.sources valueForKey:@"sources"]) {
                    NSLog(@"Id: %@", [item valueForKey:@"id"]);
                    NSLog(@"Name: %@", [item valueForKey:@"name"]);
                    NSLog(@"Url: %@", [item valueForKey:@"url"]);
                }
            }
            */
        });
    }];
    [task resume];
}

- (NSURLSession*) getURLSession {
    static NSURLSession *session = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration];
    });
    return session;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
