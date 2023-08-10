//
//  BandListTableViewController.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 13/06/2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIKitCustomViews-Swift.h"
#import "LastFMTableViewController.h"
#import "LastFMDetailViewController.h"
#import "LastFMViewModel.h"

@implementation LastFMTableViewController

#pragma mark - Table view Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure the UITableView
    self.lastFMTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.lastFMTableView registerClass:[LastFMTableViewCell class] forCellReuseIdentifier:@"LastFMCell"];
    self.lastFMTableView.delegate = self;
    self.lastFMTableView.dataSource = self;
    [self.view addSubview:self.lastFMTableView];
    
    // Create an instance of LastFMViewModel
    LastFMViewModel *lastFMViewModel = [[LastFMViewModel alloc] init];
    
    // Request artist information
    [lastFMViewModel getArtistInfo:@"Metallica" completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSString *errorMessage = [NSString stringWithFormat:@"An error occurred: %@", error.localizedDescription];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                     message:errorMessage
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } else {
            [self.lastFMTableView reloadData];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lastFMViewModel.artistInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LastFMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LastFMCell" forIndexPath:indexPath];
    
    ArtistInfo *artist = self.lastFMViewModel.artistInfoArray[indexPath.row];
    cell.lastFMNameLabel.text = artist.name;
    cell.lastFMImageView.image = [UIImage imageNamed:artist.image.firstObject.url];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LastFMDetailViewController *lastFMDetailViewController = [[LastFMDetailViewController alloc] init];
   
    if (indexPath.row < self.lastFMViewModel.artistInfoArray.count) {
        // Asigna el objeto ArtistInfo directamente a la propiedad lastFMArtist
        lastFMDetailViewController.lastFMArtist = self.lastFMViewModel.artistInfoArray[indexPath.row];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:lastFMDetailViewController animated:YES];
    }
}
@end
