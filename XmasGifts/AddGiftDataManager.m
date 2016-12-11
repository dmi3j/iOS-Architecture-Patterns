//
//  AddGiftDataManager.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "AddGiftDataManager.h"

#import "Gift.h"
#import "DataStoreInterface.h"

@implementation AddGiftDataManager

- (void)addNewGift:(Gift *)gift {
    [self.dataStore saveGift:gift];
}

- (NSInteger)numberOfGiftsWithName:(NSString *)giftName {
   return [self.dataStore giftCountWithName:giftName];
}

@end
