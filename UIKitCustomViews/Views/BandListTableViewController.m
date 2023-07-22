//
//  BandListTableViewController.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 13/06/2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BandListTableViewController.h"
#import "UIKitCustomViews-Swift.h"
#import "BandDetailViewController.h"
#import "BandListViewModel.h"

@interface BandListTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *bandTableView;

@property (nonatomic, strong) NSArray<BandListViewModel *> *bandList;

@end

@implementation BandListTableViewController

#pragma mark - Table view Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bandList = [BandListViewModel getList];
    
    self.bandTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.bandTableView registerClass:[BandTableViewCell class] forCellReuseIdentifier:@"BandCell"];
    
    self.bandTableView.delegate = self;
    self.bandTableView.dataSource = self;
    
    [self.view addSubview:self.bandTableView];
    
    [self.bandTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bandList.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BandTableViewCell *cell = (BandTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BandCell"];
    
    if (cell == nil) {
        cell = [[BandTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BandCell"];
    }
    
    // Cell data config
    BandListViewModel *band = self.bandList[indexPath.row];
    cell.bandNameLabel.text = band.bandName;
    cell.bandImageView.image = [UIImage imageNamed:band.profilePic];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BandDetailViewController *bandDetailViewController = [[BandDetailViewController alloc] init];
   
    if (indexPath.row < self.bandList.count) {
        bandDetailViewController.band = self.bandList[indexPath.row];
        
        //UI Back Button
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:bandDetailViewController animated:YES];
    }
}

@end
