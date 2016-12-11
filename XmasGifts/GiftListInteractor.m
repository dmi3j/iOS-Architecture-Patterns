//
//  GiftListInteractor.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 09/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftListInteractor.h"

#import "GiftsListDataManager.h"
#import "Gift.h"

@interface GiftListInteractor ()

@property (nonatomic, strong) GiftsListDataManager *dataManager;

@end

@implementation GiftListInteractor

- (instancetype)initWithDataManager:(GiftsListDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }

    return self;
}

#pragma mark - GiftListInteractorInput

- (void)getSortedByPriceGifts {

    __weak typeof(self) weakSelf = self;

    [self.dataManager giftsListWithCompletionHandler:^(NSArray *giftsList) {
        [weakSelf.output didGetSortedByPriceGifts:[weakSelf getSortedByPriceGiftsFromArray:giftsList] withTotalAmount:[weakSelf getTotalAmountForGiftsFromArray:giftsList]];
    }];
}

#pragma mark - 

- (NSArray *)getSortedByPriceGiftsFromArray:(NSArray *)unsortedArray {

    NSArray *sortedArray = [unsortedArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *first = [(Gift *)a giftPrice];
        NSNumber *second = [(Gift *)b giftPrice];

        if (first == nil && second == nil) {
            return NSOrderedSame;
        }
        if (first == nil) {
            return NSOrderedDescending;
        }
        if (second == nil) {
            return NSOrderedAscending;
        }
        return [second compare:first];
    }];

    return sortedArray;
}

- (NSNumber *)getTotalAmountForGiftsFromArray:(NSArray *)array {

    __block float totalAmount = 0;

    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        Gift *currentGift = obj;

        totalAmount += currentGift.giftPrice.floatValue;
    }];

    return [NSNumber numberWithFloat:totalAmount];
}

@end
