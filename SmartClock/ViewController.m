//
//  ViewController.m
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSDateFormatter *datef = [[NSDateFormatter alloc] init];
    [datef setDateFormat:@"date"];
    
    calendar = [NSCalendar currentCalendar];
    
    selectedTimeComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:timePicker.date];
    int selectedHour = [selectedTimeComponents hour];
    
    NSDateComponents *dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:[NSDate date]];
    int hour = [dateComponents hour];
    int minute = [dateComponents minute];
    
    NSLog(@"Hour:%i Minute:%i", hour, minute);
    NSLog(@"SelectedTime:%i", selectedHour);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)timePickerChange:(id)sender {
    selectedTimeComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:timePicker.date];
    int hour = [selectedTimeComponents hour];
    NSLog(@"SelectedTime:%i", hour);
    
    if (hour == 12){
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else{
        self.view.backgroundColor = [UIColor redColor];
    }
}
@end
