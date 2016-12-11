//
//  AddGiftViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "AddGiftViewController.h"

@interface AddGiftViewController ()

@property (weak, nonatomic) IBOutlet UITextField *giftName;
@property (weak, nonatomic) IBOutlet UITextField *giftPrice;
@property (weak, nonatomic) IBOutlet UIButton *addGiftButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation AddGiftViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.presenter prepareForAddingNewGift];
}

#pragma mark - AddGiftViewInterface

- (void)cleanUp {

    self.errorLabel.hidden = YES;

    self.giftName.text = @"";
    self.giftPrice.text = @"";
    self.errorLabel.text = @"";

    [self.giftName resignFirstResponder];
    [self.giftPrice resignFirstResponder];
}

- (void)displayError:(NSString *)error withName:(NSString *)name withPrice:(NSString *)price {

    self.errorLabel.hidden = NO;

    [self.giftName resignFirstResponder];
    [self.giftPrice resignFirstResponder];

    self.giftName.text = name;
    self.giftPrice.text = price;
    self.errorLabel.text = error;
}

#pragma mark -

- (IBAction)addGiftButtonPressed:(UIButton *)sender {
    [self.presenter addGiftActionWithName:self.giftName.text withPrice:self.giftPrice.text];
}

@end
