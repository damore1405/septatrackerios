//
//  PickerDelegate.h
//  
//
//  Created by Matthew D'Amore on 9/7/15.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PickerDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray * trainStations;

@end
