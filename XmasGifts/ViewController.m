//
//  ViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 14/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"

NSString *const kCellIdentifier = @"SimpleCell";

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }

    //TODO: provide data for cell
//    cell.textLabel.text = ???

    return cell;
}


@end
