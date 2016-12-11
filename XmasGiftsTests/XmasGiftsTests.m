//
//  XmasGiftsTests.m
//  XmasGiftsTests
//
//  Created by Dmitry Beloborodov on 04/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Gift.h"
#import "GiftList.h"

@interface XmasGiftsTests : XCTestCase

@end

@implementation XmasGiftsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGiftListOrdering {

    Gift *testGift1 = [[Gift alloc] initWithName:@"Cheap gift" price:@10];
    Gift *testGift2 = [[Gift alloc] initWithName:@"Expensive gift" price:@100];

    GiftList *testableGiftList = [[GiftList alloc] initWithList:@[testGift1, testGift2]];

    XCTAssertEqual(testableGiftList.gifts.firstObject, testGift2, @"The most expensive gift should be the first");
}

- (void)testGiftListUnique {

    Gift *testGift1 = [[Gift alloc] initWithName:@"Cheap gift" price:@10];
    Gift *testGift2 = [[Gift alloc] initWithName:@"Expensive gift" price:@100];

    GiftList *testableGiftList = [[GiftList alloc] initWithList:@[testGift1, testGift2]];

    Gift *testGift3 = [[Gift alloc] initWithName:@"Expensive gift" price:@100];

    XCTAssertNotNil([testableGiftList addGift:testGift3], @"Should get error when adding gift with the same name");
}

@end
