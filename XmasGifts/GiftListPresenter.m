//
//  GiftListPresenter.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftListPresenter.h"

#import "GiftListViewInterface.h"
#import "Gift.h"
#import "GiftLocalised.h"
#import "GiftListWireframe.h"

@interface GiftListPresenter ()

@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

@end

@implementation GiftListPresenter

#pragma mark - GiftListInteractorOutput

- (void)didGetSortedByPriceGifts:(NSArray *)giftsList withTotalAmount:(NSNumber *)totalAmount {
    if (giftsList.count == 0) {
        [self.userInterface displayNoGiftsView];
    } else {
        [self.userInterface displayGifts:[self getGiftsToDisplayFromArray:giftsList] withTotalAmount:[self totalAmountFromAmount:totalAmount]];
    }
}

#pragma mark - GiftListModuleInterface

- (void)updateGiftList {
    [self.giftListInteractor getSortedByPriceGifts];
}

#pragma mark - AddGiftModuleDelegateInterface

- (void)addGiftModuleDidAddGiftAction {
    [self updateGiftList];
}

#pragma mark - Prepare display data

- (NSNumberFormatter *)numberFormatter {
    if (_numberFormatter == nil) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    }

    return _numberFormatter;
}

- (NSArray *)getGiftsToDisplayFromArray:(NSArray *)gifts {

    NSMutableArray *giftsToDisplay = [NSMutableArray arrayWithCapacity:0];

    for (Gift *gift in gifts) {
        GiftLocalised *giftLocalised = [[GiftLocalised alloc] initWithName:gift.giftName price:[self.numberFormatter stringFromNumber:gift.giftPrice]];
        [giftsToDisplay addObject:giftLocalised];
    }

    return giftsToDisplay;
}

- (NSString *)totalAmountFromAmount:(NSNumber *)amount {
    return [self.numberFormatter stringFromNumber:amount];
}

@end
