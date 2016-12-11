//
//  GiftCell.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Gift;

@interface GiftCell : UITableViewCell

@property (nonatomic, strong) Gift *gift;

@end
