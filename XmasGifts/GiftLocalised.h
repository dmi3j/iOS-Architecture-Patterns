//
//  GiftLocalised.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GiftLocalised : NSObject

- (instancetype)initWithName:(NSString *)name price:(NSString *)price;

@property (nonatomic, copy) NSString *giftName;
@property (nonatomic, copy) NSString *giftPrice;

@end
