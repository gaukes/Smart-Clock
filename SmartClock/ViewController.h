//
//  ViewController.h
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    __weak IBOutlet UIDatePicker *timePicker;
    NSDateComponents *selectedTimeComponents;
    NSCalendar *calendar;
}
- (IBAction)timePickerChange:(id)sender;

@end
