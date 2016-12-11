//
//  AddGiftViewInterface.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AddGiftViewInterface <NSObject>

- (void)cleanUp;
- (void)displayError:(NSString *)error withName:(NSString *)name withPrice:(NSString *)price;

@end
