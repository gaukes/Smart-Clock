//
//  Database.h
//  SmartClock
//
//  Created by Gautham Kesineni on 2/26/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject

+ (void)openDatabase;
+ (void)saveData;
+ (NSArray*)findContact:(int)happiness;

@property (nonatomic) sqlite3 *contactDB;
@end
