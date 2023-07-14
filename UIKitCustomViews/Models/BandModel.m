//
//  BandModel.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 15/06/2023.
//

#import "BandModel.h"

@implementation BandModel

- (instancetype)initWithProfilePic:(NSString *)profilePic
                          bandName:(NSString *)bandName
                             genre:(NSString *)genre
                   bandDescription:(NSString *)bandDescription
                         startDate:(NSString *)startDate
                     originCountry:(NSString *)originCountry {
    self = [super init];
    if (self) {
        _profilePic = profilePic;
        _bandName = bandName;
        _genre = genre;
        _bandDescription = bandDescription;
        _startDate = startDate;
        _originCountry = originCountry;
    }
    return self;
}

@end
