//
//  GiftListInteractor.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 09/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GiftListInteractorIO.h"

@class GiftsListDataManager;

@interface GiftListInteractor : NSObject <GiftListInteractorInput>

- (instancetype)initWithDataManager:(GiftsListDataManager *)dataManager;

@property (nonatomic, weak) id <GiftListInteractorOutput> output;

@end
