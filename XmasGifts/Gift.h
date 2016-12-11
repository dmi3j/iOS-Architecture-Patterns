//
//  Gift.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gift : NSObject <NSCoding>

- (instancetype)initWithName:(NSString *)name price:(NSNumber *)price;

@property (nonatomic, copy) NSString *giftName;
@property (nonatomic, strong) NSNumber *giftPrice;

@end
