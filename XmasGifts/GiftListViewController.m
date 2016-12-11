//
//  GiftListViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 10/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "GiftListViewController.h"

#import "GiftListModuleInterface.h"
#import "GiftCell.h"

@interface GiftListViewController ()

@property (nonatomic, strong) NSArray *giftsList;

@property (weak, nonatomic) IBOutlet UITableView *giftsTableView;

@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;

@end

@implementation GiftListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.presenter updateGiftList];
}

#pragma mark - GiftListViewInterface

- (void)displayNoGiftsView {
    self.noItemsView.hidden = NO;
}

- (void)displayGifts:(NSArray *)gifts withTotalAmount:(NSString *)amount {

    self.noItemsView.hidden = YES;
    
    self.giftsList = gifts;

    self.totalAmountLabel.text = amount;

    [self.giftsTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.giftsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GiftCell *cell = (GiftCell *)[tableView dequeueReusableCellWithIdentifier:@"GiftCell" forIndexPath:indexPath];
    cell.gift = self.giftsList[indexPath.row];
    return cell;
}

@end
