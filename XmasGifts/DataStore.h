//
//  DataStore.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 11/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataStoreInterface.h"

@interface DataStore : NSObject <DataStoreInterface>

+ (DataStore *)sharedInstance;

@end
