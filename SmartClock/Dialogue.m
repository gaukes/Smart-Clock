//
//  Dialogue.m
//  SmartClock
//
//  Created by Gautham Kesineni on 2/27/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import "Dialogue.h"

@implementation Dialogue
@synthesize dialogueArray;

-(id)initWithdialogueArray:(NSString *)s {
    self.dialogueArray = [s componentsSeparatedByString:@"@"];
    return self;
}
@end
