//
//  GiftListViewInterface.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GiftListViewInterface <NSObject>

- (void)displayNoGiftsView;
- (void)displayGifts:(NSArray *)gifts withTotalAmount:(NSString *)amount;

@end
