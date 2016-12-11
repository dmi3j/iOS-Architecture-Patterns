//
//  AddGiftDataManager.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Gift;
@protocol DataStoreInterface;

@interface AddGiftDataManager : NSObject

@property (nonatomic, strong) id <DataStoreInterface> dataStore;

- (void)addNewGift:(Gift *)gift;

- (NSInteger)numberOfGiftsWithName:(NSString *)giftName;

@end
