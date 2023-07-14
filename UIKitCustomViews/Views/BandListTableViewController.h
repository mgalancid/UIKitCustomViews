//
//  BandListTableViewController.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 13/06/2023.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BandListViewModel.h"

@interface BandListTableViewController : UITableViewController

@property (nonatomic, strong) BandListViewModel *bandListViewModel;

@end
