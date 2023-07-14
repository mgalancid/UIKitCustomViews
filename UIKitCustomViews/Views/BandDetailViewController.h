//
//  BandDetailViewController.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 14/07/2023.
//

#import <Foundation/Foundation.h>
#import "BandListViewModel.h"

@interface BandDetailViewController : UIViewController

@property (strong, nonatomic) BandListViewModel *band;

@property (nonatomic, strong) UIImage *bandImage;

@end
