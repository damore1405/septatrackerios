//
//  FirstViewController.h
//  SeptaTrackerIos
//
//  Created by Matthew D'Amore on 9/6/15.
//  Copyright (c) 2015 derp. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *sourceSpinner;
@property (strong, nonatomic) IBOutlet UIPickerView *destSpinner;

@end

