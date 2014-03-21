//
//  AppDelegate.h
//  SmartClock
//
//  Created by Gautham Kesineni on 1/31/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"

int happiness;
int tutorialIndex;
BOOL previouslyUsed;
FMDatabase *db;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
}

-(FMDatabase *)openDatabase;

@property (strong, nonatomic) UIWindow *window;

@end
