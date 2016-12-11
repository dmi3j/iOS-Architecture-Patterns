//
//  GiftsListDataManager.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 09/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataStoreInterface;

@interface GiftsListDataManager : NSObject

@property (nonatomic, strong) id <DataStoreInterface> dataStore;

- (void)giftsListWithCompletionHandler:(void (^)(NSArray *giftsList))completionHandler;

@end
