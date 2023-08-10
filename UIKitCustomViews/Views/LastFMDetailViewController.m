//
//  BandDetailViewController.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 14/07/2023.
//

#import <UIKit/UIKit.h>
#import "LastFMDetailViewController.h"

@interface LastFMDetailViewController ()

@end

@implementation LastFMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.lastFMArtist) {
        [self configureView];
    }
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(50, 150, 300, 400)];
    stackView.axis = UILayoutConstraintAxisVertical; // Puedes cambiar a UILayoutConstraintAxisHorizontal si quieres una disposición horizontal
    
    // Agregar las vistas al stack view
    [stackView addArrangedSubview:self.lastFMImageView];
    [stackView addArrangedSubview:self.lastFMNameLabel];
    [stackView addArrangedSubview:self.lastFMGenreLabel];
    [stackView addArrangedSubview:self.lastFMDescriptionLabel];
    [stackView addArrangedSubview:self.lastFMStartDateLabel];
    [stackView addArrangedSubview:self.lastFMOriginCountryLabel];
    
    // Configurar el stack view (opcional)
    stackView.spacing = 10;
    stackView.alignment = UIStackViewAlignmentCenter;
    
    // Agregar el stack view a la vista principal
    [self.view addSubview:stackView];
}

- (void)configureView {
    
//    [self configureLabels];
//    [self configureImageView];
    
    self.lastFMImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 150, 200, 200)];
    self.lastFMNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    self.lastFMGenreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 200, 30)];
    self.lastFMDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 300, 300)];
    self.lastFMStartDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 200, 30)];
    self.lastFMOriginCountryLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 260, 200, 30)];
    
//    self.bandImageView.image = [UIImage imageNamed:self.band.profilePic];
//    self.bandNameLabel.text = self.band.bandName;
//    self.bandGenreLabel.text = self.band.genre;
//    self.bandDescriptionLabel.text = self.band.bandDescription;
//    self.bandStartDateLabel.text = self.band.startDate;
//    self.bandOriginCountryLabel.text = self.band.originCountry;
}


//- (void)configureLabels {
//    
//    self.bandNameLabel = [[UILabel alloc] init];
//    self.bandNameLabel.font = [UIFont boldSystemFontOfSize:18];
//    self.bandNameLabel.textColor = [UIColor blackColor];
//    self.bandNameLabel.textAlignment = NSTextAlignmentCenter;
//    
//    self.bandGenreLabel = [[UILabel alloc] init];
//    self.bandGenreLabel.font = [UIFont boldSystemFontOfSize:16];
//    self.bandGenreLabel.textColor = [UIColor blackColor];
//    self.bandGenreLabel.textAlignment = NSTextAlignmentCenter;
//    
//    self.bandDescriptionLabel = [[UILabel alloc] init];
//    self.bandDescriptionLabel.font = [UIFont boldSystemFontOfSize:16];
//    self.bandDescriptionLabel.textColor = [UIColor blackColor];
//    self.bandDescriptionLabel.textAlignment = NSTextAlignmentCenter;
//    
//    self.bandStartDateLabel = [[UILabel alloc] init];
//    self.bandStartDateLabel.font = [UIFont boldSystemFontOfSize:16];
//    self.bandStartDateLabel.textColor = [UIColor blackColor];
//    self.bandStartDateLabel.textAlignment = NSTextAlignmentCenter;
//    
//    self.bandOriginCountryLabel = [[UILabel alloc] init];
//    self.bandOriginCountryLabel.font = [UIFont boldSystemFontOfSize:16];
//    self.bandOriginCountryLabel.textColor = [UIColor blackColor];
//    self.bandOriginCountryLabel.textAlignment = NSTextAlignmentCenter;
//}
//
//- (void)configureImageView {
//    self.bandImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 150, 200, 200)];
//    self.bandImageView.image = [UIImage imageNamed:self.band.profilePic];
//    self.bandImageView.contentMode = UIViewContentModeScaleAspectFit;
//    self.bandImageView.clipsToBounds = YES;
//    self.bandImageView.layer.cornerRadius = 10.0;
//}

@end
