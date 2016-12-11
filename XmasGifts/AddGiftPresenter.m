//
//  AddGiftPresenter.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "AddGiftPresenter.h"

#import "AddGiftViewInterface.h"
#import "AddGiftInteractor.h"

@interface AddGiftPresenter ()

@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

@end

@implementation AddGiftPresenter

#pragma mark - AddGiftModuleInterface

- (void)prepareForAddingNewGift {
    [self.userInterface cleanUp];
}

- (void)addGiftActionWithName:(NSString *)name withPrice:(NSString *)price {
    [self.userInterface cleanUp];
    [self.addGiftInteractor addNewGiftWithName:name withPrice:[self.numberFormatter numberFromString:price]];
    [self.addGiftModuleDelegate addGiftModuleDidAddGiftAction];
}

#pragma mark - AddGiftInteractorOutput

- (void)displayError:(NSString *)error forGiftWithName:(NSString *)name withPrice:(NSNumber *)price {

    [self.userInterface displayError:error withName:name withPrice:[self.numberFormatter stringFromNumber:price]];
}

#pragma mark - Prepare display data

- (NSNumberFormatter *)numberFormatter {
    if (_numberFormatter == nil) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    }

    return _numberFormatter;
}

@end
