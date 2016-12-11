//
//  GiftsListDataManager.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 09/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftsListDataManager.h"
#import "DataStoreInterface.h"

@implementation GiftsListDataManager

- (void)giftsListWithCompletionHandler:(void (^)(NSArray *giftsList))completionHandler {

    NSArray *gifts = [self.dataStore getAllGifts];

    if (completionHandler) {
        completionHandler(gifts);
    }
}

- (NSInteger)numberOfGiftsWithName:(NSString *)giftName {
    return [self.dataStore giftCountWithName:giftName];
}

@end
