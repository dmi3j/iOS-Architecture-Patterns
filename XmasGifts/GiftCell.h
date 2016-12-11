//
//  GiftCell.h
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GiftLocalised;

@interface GiftCell : UITableViewCell

@property (nonatomic, strong) GiftLocalised *gift;

@end
