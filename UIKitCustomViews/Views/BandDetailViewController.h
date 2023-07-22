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

@property (strong, nonatomic) UIImageView *bandImageView;
@property (strong, nonatomic) UILabel *bandNameLabel;
@property (strong, nonatomic) UILabel *bandGenreLabel;
@property (strong, nonatomic) UILabel *bandDescriptionLabel;
@property (strong, nonatomic) UILabel *bandStartDateLabel;
@property (strong, nonatomic) UILabel *bandOriginCountryLabel;

@end
