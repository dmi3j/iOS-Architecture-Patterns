//
//  Gift.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "Gift.h"

@implementation Gift

- (instancetype)initWithName:(NSString *)name price:(NSNumber *)price {
    self = [super init];
    if (self) {
        self.giftName = name;
        self.giftPrice = price;
    }
    return  self;
}

- (NSString *)localisedPrice {

   NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;

    return [f stringFromNumber:self.giftPrice];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.giftName forKey:@"giftName"];
    [aCoder encodeObject:self.giftPrice forKey:@"giftPrice"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.giftName = [aDecoder decodeObjectForKey:@"giftName"];
        self.giftPrice = [aDecoder decodeObjectForKey:@"giftPrice"];
    }

    return self;
}

@end
