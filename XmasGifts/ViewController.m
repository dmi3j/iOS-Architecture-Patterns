//
//  ViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"

#import "GiftList.h"
#import "GiftCell.h"
#import "DataStore.h"

@interface ViewController () <GiftListDelegate>

@property (nonatomic, strong) NSNumberFormatter *f;

@property (weak, nonatomic) IBOutlet UITextField *giftName;
@property (weak, nonatomic) IBOutlet UITextField *giftPrice;
@property (weak, nonatomic) IBOutlet UIButton *addGiftButton;
@property (weak, nonatomic) IBOutlet UITableView *giftsTableView;
@property (weak, nonatomic) IBOutlet UILabel *giftsAmount;

// own ViewModel
@property (nonatomic, strong) GiftList *giftList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.giftList = [[GiftList alloc] initWithList:[DataStore loadGifts]];
    self.giftList.giftListDelegate = self;

    self.f = [[NSNumberFormatter alloc] init];
    self.f.numberStyle = NSNumberFormatterDecimalStyle;

    [self.giftsTableView reloadData];
}

- (IBAction)addGiftButtonPressed:(id)sender {

    Gift *giftToAdd = [[Gift alloc] initWithName:self.giftName.text price:[self.f numberFromString:self.giftPrice.text]];

    NSString *error = [self.giftList addGift:giftToAdd];
    if (error == nil) {
        self.giftName.text = nil;
        self.giftPrice.text = nil;

        [self.giftName resignFirstResponder];
        [self.giftPrice resignFirstResponder];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.giftList.gifts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GiftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GiftCell"];
    cell.gift = self.giftList.gifts[indexPath.row];
    return cell;
}

#pragma mark - GiftListDelegate

- (void)giftList:(GiftList *)giftList didUpdateTotalAmount:(NSNumber *)totalAmount {
    self.giftsAmount.text = [NSString stringWithFormat:@"Total: %@", [self.f stringFromNumber:totalAmount]];
}

- (void)giftListDidChanged:(GiftList *)giftList {
    [DataStore saveGifts:self.giftList.gifts];
    [self.giftsTableView reloadData];
}

@end
