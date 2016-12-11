//
//  DataStoreInterface.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 11/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Gift;

@protocol DataStoreInterface <NSObject>

- (NSArray *)getAllGifts;
- (NSInteger)giftCountWithName:(NSString *)name;
- (void)saveGift:(Gift *)gift;

@end
