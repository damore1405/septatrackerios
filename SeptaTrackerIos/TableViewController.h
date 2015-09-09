//
//  TableViewController.h
//  
//
//  Created by Matthew D'Amore on 9/7/15.
//
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray  * trains;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end
