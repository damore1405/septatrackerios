//
//  FirstViewController.m
//  SeptaTrackerIos
//
//  Created by Matthew D'Amore on 9/6/15.
//  Copyright (c) 2015 derp. All rights reserved.
//

#import "TrainViewController.h"


@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated{
    //Because the nav controller really isnt needed in this view... setting it to hidden
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerDelegate = [[PickerDelegate alloc] init];
    
    _destSpinner.dataSource   = _pickerDelegate;
    _destSpinner.delegate     = _pickerDelegate;
    _sourceSpinner.dataSource = _pickerDelegate;
    _sourceSpinner.delegate   = _pickerDelegate;

    [_firstView setBackgroundColor:[[UIColor alloc] initWithRed:125.0/255.0 green:167.0/255.0 blue:217.0/255.0 alpha:1]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    //Need to make sure that, once you click the button to find trains, there ara even any trains to display.
    if ([identifier isEqualToString:@"ShowConnectingTrains"]) {
        [_activityView startAnimating];
        NSString * srcStation = [ _pickerDelegate pickerView:_sourceSpinner   titleForRow:[_sourceSpinner   selectedRowInComponent:0] forComponent:0];
        NSString * dstStation = [ _pickerDelegate pickerView:_destSpinner   titleForRow:[_destSpinner   selectedRowInComponent:0] forComponent:0];
        
        //  Use a mutable string to build the url request to the septa API
        NSMutableString * requestUrlString = [[NSMutableString alloc] initWithString:@"http://www3.septa.org/hackathon/NextToArrive/"];
        [requestUrlString appendString:[srcStation stringByReplacingOccurrencesOfString:@" " withString:@"\%20"] ];
        [requestUrlString appendString:@"/"];
        [requestUrlString appendString:[dstStation stringByReplacingOccurrencesOfString:@" " withString:@"\%20"] ];
        
        
        NSLog(@"Built URL string: %@",requestUrlString); /* Log the built URL string for debugging */
        
        //Throw this string into an NSURL, and then that url into a request
        NSURL * builtRequestUrl = [[NSURL alloc] initWithString: requestUrlString];
        NSURLRequest * request = [[NSURLRequest alloc] initWithURL:builtRequestUrl];
        
        //Send the request synconously, as nothing really should be getting done while they are waiting to find trains
        NSData * result = [ NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        //The request is over... stop animation the spinner.
        [_activityView stopAnimating];
        
        //init the trains property array to the serialized result from the request to be sent to the next view controller
        _trains = [NSJSONSerialization JSONObjectWithData:result options:0 error:NULL];
        
        if (_trains.count == 0) {
            //If the count of the array is 0, then there were no trains found! shut the segue down and alert the user
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No valid trains on this route!" message:@"Try a different combo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            return NO;
        }
    }

    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //  Check to see if we are using the corrent segue to the list view
    if ( [segue.identifier isEqualToString:@"ShowConnectingTrains"] && _trains){
        TableViewController * destinationController = segue.destinationViewController;
        destinationController.trains = _trains;
    }
}

@end
