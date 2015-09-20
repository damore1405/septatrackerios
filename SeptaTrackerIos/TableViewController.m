//
//  TableViewController.m
//  
//
//  Created by Matthew D'Amore on 9/7/15.
//
//

#import "TableViewController.h"

@implementation TableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Show the nav bar again so the user can get back to the firstViewController view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections. Will be just one because they are all trains.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _trains.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"regularCell"];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"regularCell"];
    [cell setSelectionStyle: UITableViewCellSelectionStyleNone];
    
    UILabel * line = [[cell.contentView subviews] objectAtIndex:0];
    UILabel * departure = [[cell.contentView subviews] objectAtIndex:1];
    UILabel * expectedArrival = [[cell.contentView subviews] objectAtIndex:2];
    
    [line setText: [ NSString stringWithFormat:@"Line: %@",[_trains[indexPath.row] objectForKey:@"orig_line"]]];
    [departure setText: [ NSString stringWithFormat:@"Departure: %@", [_trains[indexPath.row] objectForKey:@"orig_departure_time"]]];
    [expectedArrival setText: [NSString stringWithFormat:@"Arrival: %@",[_trains[indexPath.row] objectForKey:@"orig_arrival_time"]]];
    
//    cell.textLabel.text = [_trains[indexPath.row] objectForKey:@"orig_departure_time"];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


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
