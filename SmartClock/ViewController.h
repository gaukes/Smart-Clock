//
//  ViewController.h
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController{
    int dialogueIndex;
    __weak IBOutlet UIButton *spriteFace;
    __weak IBOutlet UILabel *alarmTime;
    __weak IBOutlet UILabel *alarmTimeZone;
    __weak IBOutlet UILabel *dialogue;
    NSDateComponents *components;
    NSArray *dialogueArray;
}
- (IBAction)onSpriteClick:(id)sender;
- (void)makeFaceNeutral;
- (void)makeFacePositive;
- (void)makeFaceNegative;
- (void)changeFace;
- (void)changeFace: (int)happiness;
- (void)updateTime: (NSTimer *)timer;
- (void)updateTime;
- (void)updateDialogue;

@end
