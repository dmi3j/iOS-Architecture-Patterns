//
//  GiftCell.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftCell.h"

#import "Gift.h"

@interface GiftCell ()

@property (weak, nonatomic) IBOutlet UILabel *giftName;
@property (weak, nonatomic) IBOutlet UILabel *giftPrice;

@end

@implementation GiftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGift:(Gift *)gift {
    _gift = gift;

    self.giftName.text = _gift.giftName;
    self.giftPrice.text = _gift.localisedPrice;
}


@end
