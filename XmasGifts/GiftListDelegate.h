//
//  GiftListDelegate.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GiftList;

@protocol GiftListDelegate <NSObject>

- (void)giftList:(GiftList *)giftList didUpdateTotalAmount:(NSNumber *)totalAmount;
- (void)giftListDidChanged:(GiftList *)giftList;

@end
