//
//  FirstViewController.h
//  SeptaTrackerIos
//
//  Created by Matthew D'Amore on 9/6/15.
//  Copyright (c) 2015 derp. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "PickerDelegate.h"
#import "TableViewController.h"
#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIPickerView *sourceSpinner;
@property (strong, nonatomic) IBOutlet UIPickerView *destSpinner;
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIButton *getTrainsButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (strong, nonatomic) NSArray * trains;
@property (strong, nonatomic) PickerDelegate *pickerDelegate;

@end

