//
//  ViewController.h
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    __weak IBOutlet UIImageView *face;
    int happiness;
    __weak IBOutlet UILabel *alarmTime;
    __weak IBOutlet UILabel *alarmTimeZone;
    __weak IBOutlet UILabel *dialogue;
    NSDateComponents *components;
}
- (void)makeFaceNeutral;
- (void)makeFacePositive;
- (void)makeFaceNegative;
- (void)changeFace;
- (void)changeFace: (int)happiness;
- (void)updateTime;
- (void)updateDialogue: (NSString *)tempDialogue;

@end
