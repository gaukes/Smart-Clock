//
//  ViewController.m
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDate *date = [NSDate date];
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    components = [cal components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    [self updateTime];
    
    [self changeFace];
}

- (void)updateTime
{
    int hour = [components hour];
    int minute = [components minute];
    NSString *timeZone = @"AM";
    
    if (hour >= 12) {
        hour = hour - 12;
        timeZone = @"PM";
    }
    if (hour == 0) {
        hour += 12;
    }
    
    NSString *time = [NSString stringWithFormat:@"%i:%i%i", hour, minute/10, minute%10];
    alarmTime.text = time;
    alarmTimeZone.text = timeZone;
}

- (void)updateDialogue: (NSString *)tempDialogue
{
    dialogue.text = tempDialogue;
}

- (void)makeFaceNeutral
{
    face.image = [UIImage imageNamed: @"neutral_face.png"];
}

- (void)makeFacePositive
{
    face.image = [UIImage imageNamed: @"positive_face.png"];
}

- (void)makeFaceNegative
{
    face.image = [UIImage imageNamed: @"negative_face.png"];
}

- (void)changeFace
{
    [self changeFace: happiness];
}

-(void)changeFace: (int)tempHappiness
{
    if (tempHappiness > 600) {
        [self makeFacePositive];
    } else if (tempHappiness > 300) {
        [self makeFaceNeutral];
    } else {
        [self makeFaceNegative];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
