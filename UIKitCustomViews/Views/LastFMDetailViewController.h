//
//  BandDetailViewController.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 14/07/2023.
//

#import <Foundation/Foundation.h>
#import "LastFMViewModel.h"

@interface LastFMDetailViewController : UIViewController

//@property (strong, nonatomic) LastFMViewModel *lastFMArtist;

@property (strong, nonatomic) ArtistInfo *lastFMArtist;

@property (strong, nonatomic) UIImageView *lastFMImageView;
@property (strong, nonatomic) UILabel *lastFMNameLabel;
@property (strong, nonatomic) UILabel *lastFMGenreLabel;
@property (strong, nonatomic) UILabel *lastFMDescriptionLabel;
@property (strong, nonatomic) UILabel *lastFMStartDateLabel;
@property (strong, nonatomic) UILabel *lastFMOriginCountryLabel;

@end
