//
//  GiftListWireframe.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 11/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GiftListPresenter;
@class AddGiftWireframe;

@interface GiftListWireframe : NSObject

@property (nonatomic, strong) AddGiftWireframe *addGiftWireframe;

@property (nonatomic, strong) GiftListPresenter *giftListPresenter;

/**
 Router method to show "Gift List" interface in custom view;
 Not used in this example; replaced with embedded view segue

 @param view target view to set "Gift List" interface
 */
- (void)presentGiftListInterfaceInView:(UIView *)view;


/**
 Example to integrate with other modules; i.e. "Edit Gift"
 */
- (void)presentEditGiftInterface;

@end
