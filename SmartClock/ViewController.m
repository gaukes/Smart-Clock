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
    if (!previouslyUsed) {
        NSLog(@"got this far");
        [self firstTime];
        [self updateDialogue];
    } else {
        dialogueArray = [self getRandomDialogue].dialogueArray;
        [self updateDialogue];
    }
    happiness++;
    NSLog(@"%i", happiness);
    
    [self updateTime];
    [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [self changeFace];
}

- (void) firstTime
{
    dialogueArray = [self getTutorialDialogue:tutorialIndex].dialogueArray;
    alarmButton.enabled = false;
    settingsButton.enabled = false;
}

- (void) onSpriteClick:(id)sender
{
    if(!previouslyUsed) {
        if(dialogueIndex + 1 == [dialogueArray count]) {
            alarmButton.enabled = true;
            tutorialIndex += 1;
        }
    }
    [self updateDialogue];
}

- (void)updateTime:(NSTimer *)timer
{
    [self updateTime];
}

- (void)updateTime
{
    NSDate *date = [NSDate date];
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    components = [cal components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    
    int hour = (int)[components hour];
    int minute = (int)[components minute];
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

- (void)updateDialogue
{
    if (dialogueIndex < [dialogueArray count]) {
        [dialogue setText:dialogueArray[dialogueIndex]];
    }
    dialogueIndex+=1;
}

- (Dialogue *)getRandomDialogue
{
    FMResultSet *results = [db executeQuery:@"SELECT * FROM data WHERE special=0 ORDER BY RANDOM()"];
    [results next];
    NSString *dial = [results stringForColumnIndex:1]; //for some reason, this has to be 1
    Dialogue *temp = [[Dialogue alloc] initWithdialogueArray:dial];
    return temp;
}

- (Dialogue *)getTutorialDialogue:(int)placeNum
{
    FMResultSet *results = [db executeQuery:@"SELECT * FROM data WHERE special=1"];
    for(int i=0; i < placeNum+1; i++) {
        [results next];
    }
    NSString *dial = [results stringForColumnIndex:1]; //far some reason, this has to be 1
    Dialogue *temp = [[Dialogue alloc] initWithdialogueArray:dial];
    return temp;
}

- (void)makeFaceNeutral
{
    [spriteFace setImage:[UIImage imageNamed:@"neutral_face.png"] forState:UIControlStateNormal];
}

- (void)makeFacePositive
{
    [spriteFace setImage:[UIImage imageNamed:@"positive_face.png"] forState:UIControlStateNormal];
}

- (void)makeFaceNegative
{
    [spriteFace setImage:[UIImage imageNamed:@"negative_face.png"] forState:UIControlStateNormal];
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
