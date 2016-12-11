//
//  DataStore.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStore : NSObject

+ (NSArray *)loadGifts;
+ (void)saveGifts:(NSArray *)gifts;

@end
