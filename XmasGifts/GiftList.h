//
//  GiftList.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Gift.h"
#import "GiftListDelegate.h"

@interface GiftList : NSObject

- (instancetype)initWithList:(NSArray *)gifts;

@property (nonatomic, readonly) NSArray <Gift *> *gifts;

@property (nonatomic, weak) id <GiftListDelegate> giftListDelegate;

- (NSString *)addGift:(Gift *)gift;

//TODO:
//- (void)removeGift:(Gift *)gift;

@end
