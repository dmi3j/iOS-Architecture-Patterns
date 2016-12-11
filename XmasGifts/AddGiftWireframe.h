//
//  AddGiftWireframe.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 11/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AddGiftPresenter;

/**
 Contains all the custom navigation logic (i.e. custom transitions)
 */
@interface AddGiftWireframe : NSObject

@property (nonatomic, strong) AddGiftPresenter *addGiftPresenter;

/**
 Router method to show "Add Gift" interface in custom view;
 Not used in this example; replaced with embedded view segue

 @param view target view to set "Add Gift" interface
 */
- (void)presentAddGiftInterfaceInView:(UIView *)view;

@end
