//
//  GiftLocalised.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftLocalised.h"

@implementation GiftLocalised

- (instancetype)initWithName:(NSString *)name price:(NSString *)price {
    self = [super init];
    if (self) {
        self.giftName = name;
        self.giftPrice = price;
    }
    return  self;
}

@end
