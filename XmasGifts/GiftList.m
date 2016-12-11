//
//  GiftList.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftList.h"

@interface GiftList ()

@property (nonatomic, strong) NSMutableArray *unsortedGifts;

@end

@implementation GiftList

- (instancetype)initWithList:(NSArray *)gifts {
    self = [super init];
    if (self) {
        self.unsortedGifts = [NSMutableArray arrayWithArray:gifts];
    }
    return  self;
}

- (NSString *)addGift:(Gift *)gift {
    __block NSString *addGirtError = nil;

    // verify similar gift exist
    __block NSString *giftName = gift.giftName;

    [self.unsortedGifts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Gift *currentGift = obj;
        if ([currentGift.giftName isEqualToString:giftName]) {
            addGirtError = @"This gift already exist";
            *stop = YES;
        }
    }];

    if (addGirtError == nil) {

        [self.unsortedGifts addObject:gift];

        //nofity gift list updated
        if (self.giftListDelegate && [self.giftListDelegate respondsToSelector:@selector(giftListDidChanged:)]) {
            [self.giftListDelegate giftListDidChanged:self];
        }

        //notify gift total amount changed
        if (self.giftListDelegate && [self.giftListDelegate respondsToSelector:@selector(giftList:didUpdateTotalAmount:)]) {
            [self.giftListDelegate giftList:self didUpdateTotalAmount:[self getTotalAmount]];
        }
    }

    return addGirtError;
}

- (NSArray <Gift *> *)gifts {

    NSArray *sortedArray = [self.unsortedGifts sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *first = [(Gift *)a giftPrice];
        NSNumber *second = [(Gift *)b giftPrice];
        return [second compare:first];
    }];

    if (self.giftListDelegate && [self.giftListDelegate respondsToSelector:@selector(giftList:didUpdateTotalAmount:)]) {
        [self.giftListDelegate giftList:self didUpdateTotalAmount:[self getTotalAmount]];
    }

    return sortedArray;
}

- (NSNumber *)getTotalAmount {
    __block float totalAmount = 0;

    [self.unsortedGifts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        Gift *currentGift = obj;

        totalAmount += currentGift.giftPrice.floatValue;
    }];

    return [NSNumber numberWithFloat:totalAmount];
}

@end
