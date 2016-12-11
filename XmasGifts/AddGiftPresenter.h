//
//  AddGiftPresenter.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AddGiftModuleInterface.h"
#import "AddGiftModuleDelegateInterface.h"
#import "AddGiftInteractorIO.h"

@class AddGiftInteractor;
@class AddGiftWireframe;

@protocol AddGiftViewInterface;

@interface AddGiftPresenter : NSObject <AddGiftModuleInterface, AddGiftInteractorOutput>

@property (nonatomic, strong) AddGiftInteractor *addGiftInteractor;
@property (nonatomic, strong) AddGiftWireframe *addGiftWireframe;

@property (nonatomic, weak) id <AddGiftModuleDelegateInterface> addGiftModuleDelegate;
@property (nonatomic, weak) id <AddGiftViewInterface> userInterface;

@end
