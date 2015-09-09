//
//  PickerDelegate.m
//  
//
//  Created by Matthew D'Amore on 9/7/15.
//
//

#import "PickerDelegate.h"

@implementation PickerDelegate

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _trainStations = [[NSMutableArray alloc] init];
        
        NSString * stationCsvData =  [[NSString alloc]
                               initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"stations" ofType:@"csv"]
                               encoding:NSUTF8StringEncoding error:nil];
        
        for (NSString * line in [stationCsvData componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]]) {
            NSArray * seperatedLine = [line componentsSeparatedByString:@","];
            
            [_trainStations addObject:seperatedLine[1]];
        }
        
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _trainStations.count;

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _trainStations[row];
}
@end
