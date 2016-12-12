//
//  ViewController.m
//  XmasGifts
//
//  Created by Dmitry Beloborodov on 03/12/2016.
//  Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "ViewController.h"
#import "Gift.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addNewTextField;
@property (weak, nonatomic) IBOutlet UITextField *giftPriceTextField;
@property (weak, nonatomic) IBOutlet UIButton *addNewButton;
@property (weak, nonatomic) IBOutlet UITableView *giftsTableView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

@property (nonatomic, strong) NSMutableArray *gifts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    docDir = [docDir stringByAppendingPathComponent:@"Gifts"];
    NSError *error = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:NO attributes:nil error:&error];
    }

    NSString *dataPath = nil;

    dataPath = [docDir stringByAppendingPathComponent:@"gifts"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        self.gifts = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    }
    else {
        self.gifts = [NSMutableArray arrayWithCapacity:0];
    }
}

- (NSNumberFormatter *)numberFormatter {
    if (_numberFormatter == nil) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        _numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    }

    return _numberFormatter;
}

- (IBAction)addNewButtonPressed:(id)sender {

    __block NSString *giftName = self.addNewTextField.text;
    __block BOOL giftAlreadyExist = NO;

    [self.gifts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Gift *currentGift = obj;
        if ([currentGift.giftName isEqualToString:giftName]) {
            giftAlreadyExist = YES;
            *stop = YES;
        }
    }];

    if (giftAlreadyExist) {
        self.errorLabel.text = @"Gift with this name already exist";
    } else {

        Gift *gift = [[Gift alloc] initWithName:self.addNewTextField.text price:[self.numberFormatter numberFromString:self.giftPriceTextField.text]];
        [self.gifts addObject:gift];

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        docDir = [docDir stringByAppendingPathComponent:@"Gifts"];
        NSError *error = nil;
        if (![[NSFileManager defaultManager] fileExistsAtPath:docDir]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:docDir withIntermediateDirectories:NO attributes:nil error:&error];
        }

        [NSKeyedArchiver archiveRootObject:self.gifts toFile:[docDir stringByAppendingPathComponent:@"gifts"]];

        self.addNewTextField.text = nil;
        self.giftPriceTextField.text = nil;
        self.errorLabel.text = nil;

        [self.addNewTextField resignFirstResponder];
        [self.giftPriceTextField resignFirstResponder];

        [self.giftsTableView reloadData];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gifts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custom-cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"custom-cell"];
    }

    Gift *gift = self.gifts[indexPath.row];
    
    cell.textLabel.text = gift.giftName;
    cell.detailTextLabel.text = gift.localisedPrice;
    
    return cell;
}

@end
