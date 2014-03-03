//
//  Dialogue.h
//  SmartClock
//
//  Created by Gautham Kesineni on 2/27/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dialogue : NSObject {
    NSArray *dialogueArray;
    int deltaHappiness;
    int baseHappiness;
}

@property (nonatomic, retain) NSArray *dialogueArray;

-(id)initWithdialogueArray:(NSString *)s;

@end
