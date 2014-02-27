//
//  Database.m
//  SmartClock
//
//  Created by Gautham Kesineni on 2/26/14.
//  Copyright (c) 2014 Gautham Kesineni. All rights reserved.
//

#import "Database.h"

@implementation Database

static sqlite3 *database;
static NSString* databasePath;

+(void) openDatabase {
    NSString *docsDir;
    NSArray *dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];

    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"data.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath] == NO) {
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite_open(dbpath, &database) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS DATABASE (ID INTEGER PRIMARY KEY AUTOINCREMENT, SPEECH BLOB)";
            
            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                NSLog(@"Failed to create table");
            }
            sqlite3_close(database);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
}

+(void) saveData {
    sqlite3_stmt *statement;
    const char *dbpath = [databasePath UTF8String];
}


@end
