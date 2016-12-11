//
//  AddGiftViewController.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AddGiftViewInterface.h" 
#import "AddGiftModuleInterface.h"

@interface AddGiftViewController : UIViewController <AddGiftViewInterface>

@property (nonatomic, strong) id<AddGiftModuleInterface> presenter;

@end
