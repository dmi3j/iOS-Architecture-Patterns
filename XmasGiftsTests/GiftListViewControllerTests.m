//
//  GiftListViewControllerTests.m
//  XmasGifts
//
//  Created by Dmitrijs Beloborodovs on 12/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "GiftListViewController.h"

@interface GiftListViewControllerTests : XCTestCase

@property (nonatomic, strong) GiftListViewController *giftListViewController;

@end

@implementation GiftListViewControllerTests

- (void)setUp {
    [super setUp];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.giftListViewController = [storyboard instantiateViewControllerWithIdentifier:@"GiftListViewController_ID"];
}

- (void)testNoContentView {

    [self.giftListViewController displayNoGiftsView];

    XCTAssertTrue(self.giftListViewController.noItemsView.hidden == NO, @"No item view should be visible");
}

@end
