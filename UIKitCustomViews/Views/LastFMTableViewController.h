//
//  BandListTableViewController.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 13/06/2023.
//

#import <UIKit/UIKit.h>
#import "LastFMViewModel.h"

@interface LastFMTableViewController : UITableViewController

@property (strong, nonatomic) UITableView *lastFMTableView;

@property (nonatomic, strong) LastFMViewModel *lastFMViewModel;

@end

