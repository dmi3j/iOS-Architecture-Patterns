//
//  GiftListViewController.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GiftListViewInterface.h"

@protocol GiftListModuleInterface;

@interface GiftListViewController : UIViewController <GiftListViewInterface>

@property (weak, nonatomic) IBOutlet UIView *noItemsView;

@property (nonatomic, strong) id <GiftListModuleInterface> presenter;

@end
