//
//  GiftCell.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftCell.h"

#import "GiftLocalised.h"

@interface GiftCell ()

@property (weak, nonatomic) IBOutlet UILabel *giftName;
@property (weak, nonatomic) IBOutlet UILabel *giftPrice;

@end

@implementation GiftCell

- (void)setGift:(GiftLocalised *)gift {
    _gift = gift;

    self.giftName.text = _gift.giftName;
    self.giftPrice.text = _gift.giftPrice;
}

@end
