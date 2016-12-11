//
//  AddGiftInteractor.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "AddGiftInteractor.h"

#import "AddGiftDataManager.h"
#import "Gift.h"

@interface AddGiftInteractor ()

@property (nonatomic, strong) AddGiftDataManager *dataManager;

@end

@implementation AddGiftInteractor

- (instancetype)initWithDataManager:(AddGiftDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }

    return self;
}

#pragma mark - AddGiftInteractorInput

- (void)addNewGiftWithName:(NSString *)name withPrice:(NSNumber *)price {

    // empty name
    if (name.length == 0) {
        NSString *error = @"Gift name canno't be empty";
        [self.output displayError:error forGiftWithName:name withPrice:price];
    }
    // business logic: unique records only
    else if ([self.dataManager numberOfGiftsWithName:name] > 0) {
        NSString *error = @"Gift with this name already exist";
        [self.output displayError:error forGiftWithName:name withPrice:price];
    }
    else {
        if (price == nil) price = @0;
        Gift *gift = [[Gift alloc] initWithName:name price:price];
        [self.dataManager addNewGift:gift];
    }
}

@end
