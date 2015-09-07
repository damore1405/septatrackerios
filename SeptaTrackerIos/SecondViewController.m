//
//  SecondViewController.m
//  SeptaTrackerIos
//
//  Created by Matthew D'Amore on 9/6/15.
//  Copyright (c) 2015 derp. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController



- (void) setUpMap {
    CLLocationCoordinate2D test = CLLocationCoordinate2DMake(39.954263, -75.189080);
    MKCoordinateRegion  i = MKCoordinateRegionMakeWithDistance(test, 40000, 40000);
    [_mMap setRegion:i];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMap];
    
    // TODO:
    NSURL * septaAPI = [[NSURL alloc] initWithString:@"http://www3.septa.org/hackathon/TrainView/"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:septaAPI];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSArray * test = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             
             for (NSDictionary * i in test) {
                 
                 MKPointAnnotation * trainLocationAnnotation = [[MKPointAnnotation alloc] init];
                 
                 CLLocationDegrees lat = [[i objectForKey:@"lat"] doubleValue];
                 CLLocationDegrees lon = [[i objectForKey:@"lon"] doubleValue];
                 NSString      *number = [i objectForKey:@"trainno"];
                 
                 CLLocationCoordinate2D trainLatLon = CLLocationCoordinate2DMake(lat, lon);
                 
                 trainLocationAnnotation.coordinate = trainLatLon;
                 trainLocationAnnotation.title = number;
                 
                 [_mMap addAnnotation:trainLocationAnnotation];
                 
             }
             
             NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
         }
     }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
