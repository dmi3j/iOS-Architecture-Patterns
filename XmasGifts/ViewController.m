//
//  ViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addNewTextField;
@property (weak, nonatomic) IBOutlet UIButton *addNewButton;
@property (weak, nonatomic) IBOutlet UITableView *giftsTableView;

@property (nonatomic, strong) NSMutableArray *gifts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.gifts = [NSMutableArray arrayWithCapacity:0];
}

- (IBAction)addNewButtonPressed:(id)sender {
    [self.gifts addObject:self.addNewTextField.text];
    self.addNewTextField.text = nil;

    [self.addNewTextField resignFirstResponder];

    [self.giftsTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gifts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custom-cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"custom-cell"];
    }
    cell.textLabel.text = self.gifts[indexPath.row];
    return cell;
}

@end
