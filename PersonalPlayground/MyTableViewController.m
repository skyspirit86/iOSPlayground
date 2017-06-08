//
//  MyTableViewController.m
//  PersonalPlayground
//
//  Created by Varga Zolt on 6/5/17.
//  Copyright © 2017 Varga Zolt. All rights reserved.
//

#import "MyTableViewController.h"
#import "CustomTableViewCell.h"

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
    self.tableData = @[@"Item1",
                       @"Item2",
                       @"Item3",
                       @"Item4",
                       @"Item5",
                       @"Item6",
                       @"Item7",
                       @"Item8",
                       @"Item9",
                       @"Item10"];
    
    // REST API endpoint
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users"]];
    
    NSURLSessionDataTask *task = [[self getURLSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // my code
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // json parsing from endpoint
            // NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            NSError *jsonError;
            NSArray *parsedJSONArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            
            // NSLog(@"KRCO: %@", data);
            // NSLog(@"KRCO: %@", result);
            // NSLog(@"KRCO: %@", parsedJSONArray);
            NSLog(@"KRCO: %@", [parsedJSONArray valueForKey:@"email"]);
        });
    }];
    [task resume];
}

-(NSURLSession*) getURLSession {
    static NSURLSession *session = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration];
    });
    return session;
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
    return [self.tableData count];
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
    
    cell.nameLabel.text = self.tableData[indexPath.row];
    cell.lastNameLabel.text = @"Zolt";
    cell.emailLabel.text = @"skyspirit86@gmail.com";
    cell.profileImage.image = [UIImage imageNamed:@"bg_test"];
    cell.idLabel.text = @"12345";
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *rowValue = self.tableData[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"Selected row: %@", rowValue];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row selected!" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
