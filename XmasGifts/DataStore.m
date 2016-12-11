//
//  DataStore.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 11/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "DataStore.h"

#import "Gift.h"

@implementation DataStore

#pragma mark - Singleton

+ (DataStore *)sharedInstance {
    static dispatch_once_t onceToken;
    static DataStore *shared = nil;

    dispatch_once(&onceToken, ^{
        shared = [[DataStore alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        //custom initialiazation
    }

    return self;
}

#pragma mark - DataStoreInterface

- (NSArray *)getAllGifts {
    return [self loadGifts];
}

- (NSInteger)giftCountWithName:(NSString *)name {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"giftName CONTAINS[c] %@", name];
    return  [[self loadGifts] filteredArrayUsingPredicate:predicate].count;
}

- (void)saveGift:(Gift *)gift {
    NSMutableArray *allGifts = [NSMutableArray arrayWithArray:[self loadGifts]];
    [allGifts addObject:gift];
    [self saveGifts:allGifts];
}

#pragma mark - Private 

- (NSArray *)loadGifts {
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

- (void)saveGifts:(NSArray *)gifts {

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
