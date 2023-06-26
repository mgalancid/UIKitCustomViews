//
//  BandListTableViewController.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 13/06/2023.
//

#import <Foundation/Foundation.h>
#import "BandListTableViewController.h"
#import "UIKitCustomViews-Swift.h"
#import "BandModel.h"

@interface BandListTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *bandTableView;

@property (nonatomic, strong) NSArray<BandModel *> *bandList;

@end

@implementation BandListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bandList = [BandModel getList];
    
    self.bandTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.bandTableView registerClass:[BandTableViewCell class] forCellReuseIdentifier:@"BandCell"];
    
    self.bandTableView.delegate = self;
    self.bandTableView.dataSource = self;
    
    [self.view addSubview:self.bandTableView];
    
    [self.bandTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bandList.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BandTableViewCell *cell = (BandTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BandCell"];
    
    if (cell == nil) {
        cell = [[BandTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BandCell"];
    }
    
    // Configura los datos de la celda
    BandModel *band = self.bandList[indexPath.row];
    cell.bandNameLabel.text = band.bandName;
    cell.bandImageView.image = [UIImage imageNamed:band.profilePic];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
