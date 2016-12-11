//
//  DataStore.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "DataStore.h"
#import "Gift.h"

@implementation DataStore

+ (NSArray *)loadGifts {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    docDir = [docDir stringByAppendingPathComponent:@"Gifts"];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:NO attributes:nil error:&error];
    }

    NSString *dataPath = nil;

    dataPath = [docDir stringByAppendingPathComponent:@"gifts"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    }
    else {
        return nil;
    }
}

+ (void)saveGifts:(NSArray *)gifts {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    docDir = [docDir stringByAppendingPathComponent:@"Gifts"];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:NO attributes:nil error:&error];
    }

    [NSKeyedArchiver archiveRootObject:gifts toFile:[docDir stringByAppendingPathComponent:@"gifts"]];
}

@end
