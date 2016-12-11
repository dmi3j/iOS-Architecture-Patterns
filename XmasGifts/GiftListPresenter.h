//
//  GiftListPresenter.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GiftListInteractorIO.h"
#import "GiftListModuleInterface.h"
#import "AddGiftModuleDelegateInterface.h"

@class GiftListWireframe;
@protocol GiftListViewInterface;

@interface GiftListPresenter : NSObject <GiftListInteractorOutput, GiftListModuleInterface, AddGiftModuleDelegateInterface>

@property (nonatomic, strong) id <GiftListInteractorInput> giftListInteractor;
@property (nonatomic, strong) GiftListWireframe *giftListWireframe;

@property (nonatomic, weak) id <GiftListViewInterface> userInterface;

@end
