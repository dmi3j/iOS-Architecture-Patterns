//
//  GiftListInteractorIO.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 09/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GiftListInteractorInput <NSObject>
- (void)getSortedByPriceGifts;
@end


@protocol GiftListInteractorOutput <NSObject>
- (void)didGetSortedByPriceGifts:(NSArray *)giftsList withTotalAmount:(NSNumber *)totalAmount;
@end
