//
//  AddGiftInteractor.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddGiftInteractorIO.h"

@class AddGiftDataManager;

@interface AddGiftInteractor : NSObject <AddGiftInteractorInput>

- (instancetype)initWithDataManager:(AddGiftDataManager *)dataManager;

@property (nonatomic, weak) id <AddGiftInteractorOutput> output;

@end
