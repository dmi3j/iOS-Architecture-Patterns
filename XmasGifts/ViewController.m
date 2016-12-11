//
//  ViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"

#import "DataStore.h"

#import "GiftListViewController.h"
#import "AddGiftViewController.h"

#import "GiftListPresenter.h"
#import "AddGiftPresenter.h"

#import "GiftListModuleInterface.h"
#import "AddGiftModuleInterface.h"

#import "GiftsListDataManager.h"
#import "AddGiftDataManager.h"

#import "GiftListInteractor.h"
#import "AddGiftInteractor.h"

#import "GiftListWireframe.h"
#import "AddGiftWireframe.h"

@interface ViewController ()

@property (nonatomic, strong) GiftListWireframe *giftListWireframe;
@property (nonatomic, strong) AddGiftWireframe *addGiftWireframe;

@end

@implementation ViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    [self prepareConfiguration];
}

/**
 Root wireframe
 */
- (void)prepareConfiguration {

    // Common
    DataStore *dataStore = [DataStore sharedInstance];

    // Gift List Module
    GiftListPresenter *giftListPresenter = [[GiftListPresenter alloc] init];
    GiftsListDataManager *giftsListDataManager = [[GiftsListDataManager alloc] init];
    GiftListInteractor *giftListInteractor = [[GiftListInteractor alloc] initWithDataManager:giftsListDataManager];
    GiftListWireframe *giftListWireframe = [[GiftListWireframe alloc] init];

    //Add Gift Module
    AddGiftPresenter *addGiftPresenter = [[AddGiftPresenter alloc] init];
    AddGiftDataManager *addGiftDataManager = [[AddGiftDataManager alloc] init];
    AddGiftInteractor *addGiftInteractor = [[AddGiftInteractor alloc] initWithDataManager:addGiftDataManager];
    AddGiftWireframe *addGiftWireframe = [[AddGiftWireframe alloc] init];

    // Gift List Module
    giftListInteractor.output = giftListPresenter;

    giftListPresenter.giftListInteractor = giftListInteractor;
    giftListPresenter.giftListWireframe = giftListWireframe;
    giftListWireframe.addGiftWireframe = addGiftWireframe;
    giftListWireframe.giftListPresenter = giftListPresenter;
    self.giftListWireframe = giftListWireframe;
    giftsListDataManager.dataStore = dataStore;

    //Add Gift Module

    addGiftInteractor.output = addGiftPresenter;

    addGiftPresenter.addGiftInteractor = addGiftInteractor;
    addGiftWireframe.addGiftPresenter = addGiftPresenter;
    addGiftPresenter.addGiftWireframe = addGiftWireframe;
    addGiftPresenter.addGiftModuleDelegate = giftListPresenter;
    self.addGiftWireframe = addGiftWireframe;
    addGiftDataManager.dataStore = dataStore;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"EmbedAddGift_ID"]) {
        AddGiftViewController *addGiftViewController = segue.destinationViewController;
        addGiftViewController.presenter = self.addGiftWireframe.addGiftPresenter;
        self.addGiftWireframe.addGiftPresenter.userInterface = addGiftViewController;

    } else if ([segue.identifier isEqualToString:@"EmbedListGifts_ID"]) {
        GiftListViewController *giftListViewController = segue.destinationViewController;
        giftListViewController.presenter = self.giftListWireframe.giftListPresenter;
        self.giftListWireframe.giftListPresenter.userInterface = giftListViewController;
    }
}

@end
