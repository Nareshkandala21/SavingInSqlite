//
//  DBManager.m
//  SampleSqlite
//
//  Created by Naresh Kandala on 23/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"
@implementation DBManager



-(NSString *)databasePath{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"Employee.sqlite"];
    
    BOOL success = [fileManager fileExistsAtPath:dbPath];
    
    if (!success) {
        
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Employee.sqlite"];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
        if (!success) {
            
            NSLog(@"Failed to create writable DB. Error '%@'.", [error localizedDescription]);
            
        } else {
            
            NSLog(@"DB copied.");
            
        }
        
    }else {
        
        NSLog(@"DB exists, no need to copy.");
        
    }
    NSLog(@"dbpath%@",dbPath);
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    
    [database open];
    
    NSString *insertQuery_Names = @"CREATE TABLE Employee (  FirstNames TEXT, LastNames TEXT, Image TEXT  )";
    //    NSString *insertQuery_City = @"CREATE TABLE City (  City TEXT,  CityID TEXT)";
    //    NSString *insertQuery_Media = @"CREATE TABLE Media (  CityID TEXT,  MediaType TEXT, Medianame TEXT)";
    
    
    //    NSString *insertQuery_HORDINGS = @"CREATE TABLE Hordings (  Address TEXT,  sitecode TEXT,  sitename TEXT,  w TEXT,  h TEXT,  orientation TEXT,  type TEXT,  ZIP TEXT,  traffic TEXT,  area  TEXT,  siterate  TEXT,  status  TEXT,  image  TEXT )";
    //    NSString *insertQuery_City = @"CREATE TABLE City (  City TEXT,  CityID TEXT)";
    //    NSString *insertQuery_Media = @"CREATE TABLE Media (  CityID TEXT,  MediaType TEXT, Medianame TEXT)";
    //
    //    NSString *insertQuery_Mediadetails = @"CREATE TABLE Mediadetails (  SITE_CODE TEXT,  CITY_ID TEXT, MEDIA_TYPE_ID TEXT, OWNERSHIP TEXT, ADDRESS1 TEXT, ADDRESS2 TEXT, ADDRESS3 TEXT, AREA_SQR TEXT, ORIENTATION TEXT, TYPE TEXT, TRAFFIC TEXT, BASE_RATE TEXT, SALE_RATE TEXT, CARD_RATE TEXT, BARTER_RATE TEXT, HOARDING_LENGTH TEXT, HOARDING_HEIGHT TEXT, TOP_PANEL_LENGTH TEXT, TOP_PANEL_HEIGHT TEXT, TOP_SIDE_PANEL_LENGTH TEXT, TOP_SIDE_PANEL_HEIGHT TEXT, TOP_SIDE_PANEL_NO_OF_FACES TEXT, BACK_PANEL1_LENGTH TEXT, BACK_PANEL1_HEIGHT TEXT, BACK_PANEL2_LENGTH TEXT, BACK_PANEL2_HEIGHT TEXT, FSU_LENGTH TEXT, FSU_HEIGHT, FSU_NO_OF_FACES TEXT, IMAGE_NAME TEXT , Latitude TEXT ,Longitude TEXT )";
    //
    //    NSString *insertQuery_MediaAvailablity = @"CREATE TABLE MediaAvailablity (  CLIENT_NAME TEXT, FROM_DATE TEXT, TO_DATE TEXT, FLAG TEXT, SITE_CODE TEXT, SALESPERSON_NAME TEXT )";
    //
    //    NSString *insertQuery_BQS = @"CREATE TABLE BQS (  Address TEXT,  sitecode TEXT,  sitename TEXT,  frontpannel_h TEXT,  frontpannel_w TEXT,  backdrop_h TEXT,  backdrop_w TEXT,  sidepannel_h TEXT,  sidepannel_w TEXT,  orientation TEXT,  type TEXT,  traffic TEXT,  area  TEXT,  landmark  TEXT,  rate  TEXT,  status  TEXT,  image TEXT  )";
    
    
    [database executeUpdate:insertQuery_Names];
    //    [database executeUpdate:insertQuery_HORDINGS];
    //    [database executeUpdate:insertQuery_City];
    //    [database executeUpdate:insertQuery_Media];
    //    [database executeUpdate:insertQuery_Mediadetails];
    //    [database executeUpdate:insertQuery_MediaAvailablity];
    
    [database close];
    
    return dbPath;
    
}

@end
