//
//  AddGiftInteractorIO.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddGiftInteractorInput <NSObject>
- (void)addNewGiftWithName:(NSString *)name withPrice:(NSNumber *)price;

@end

@protocol AddGiftInteractorOutput <NSObject>
- (void)displayError:(NSString *)error forGiftWithName:(NSString *)name withPrice:(NSNumber *)price;
@end
