//
//  ViewController.h
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Dialogue.h"

@interface ViewController : UIViewController{
    int dialogueIndex;
    __weak IBOutlet UIButton *spriteFace;
    __weak IBOutlet UILabel *alarmTime;
    __weak IBOutlet UILabel *alarmTimeZone;
    __weak IBOutlet UILabel *dialogue;
    __weak IBOutlet UIButton *settingsButton;
    __weak IBOutlet UIButton *alarmButton;
    NSDateComponents *components;
    NSArray *dialogueArray;
}
- (IBAction)onSpriteClick:(id)sender;
- (void)firstTime;
- (void)makeFaceNeutral;
- (void)makeFacePositive;
- (void)makeFaceNegative;
- (void)changeFace;
- (void)changeFace: (int)happiness;
- (void)updateTime: (NSTimer *)timer;
- (void)updateTime;
- (void)updateDialogue;
- (Dialogue *)getRandomDialogue;

@end
