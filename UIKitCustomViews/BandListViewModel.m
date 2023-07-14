//
//  BandListViewModel.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 11/07/2023.
//

#import "BandListViewModel.h"
#import <Foundation/Foundation.h>

@implementation BandListViewModel

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

+ (NSArray<BandListViewModel *> *)getList {
    BandListViewModel *band1 = [[BandListViewModel alloc] initWithProfilePic:@"band1"
                                                   bandName:@"Metallica"
                                                      genre:@"Metal"
                                            bandDescription:@"Metallica is an American heavy metal band formed in 1981. Known for their aggressive sound, they have been one of the most influential and successful metal bands of all time."
                                                  startDate:@"1981"
                                              originCountry:@"United States"];

    BandListViewModel *band2 = [[BandListViewModel alloc] initWithProfilePic:@"band2"
                                                   bandName:@"Iron Maiden"
                                                      genre:@"Metal"
                                            bandDescription:@"Iron Maiden is an English heavy metal band formed in 1975. With their distinctive sound and epic compositions, they have become one of the most enduring and iconic bands in metal history."
                                                  startDate:@"1975"
                                              originCountry:@"United Kingdom"];

    BandListViewModel *band3 = [[BandListViewModel alloc] initWithProfilePic:@"band3"
                                                   bandName:@"AC/DC"
                                                      genre:@"Rock"
                                            bandDescription:@"AC/DC is an Australian rock band formed in 1973. Their high-energy performances and timeless rock anthems have made them one of the greatest rock bands in history."
                                                  startDate:@"1973"
                                              originCountry:@"Australia"];

    BandListViewModel *band4 = [[BandListViewModel alloc] initWithProfilePic:@"band4"
                                                   bandName:@"Guns N' Roses"
                                                      genre:@"Rock"
                                            bandDescription:@"Guns N' Roses is an American rock band formed in 1985. Combining elements of hard rock and glam metal, they achieved massive success with their debut album and became one of the defining bands of the late 1980s."
                                                  startDate:@"1985"
                                              originCountry:@"United States"];

    BandListViewModel *band5 = [[BandListViewModel alloc] initWithProfilePic:@"band5"
                                                   bandName:@"Black Sabbath"
                                                      genre:@"Metal"
                                            bandDescription:@"Black Sabbath is an English heavy metal band formed in 1968. Widely regarded as the pioneers of the genre, their dark and heavy sound laid the foundation for generations of metal bands to come."
                                                  startDate:@"1968"
                                              originCountry:@"United Kingdom"];

    NSArray<BandListViewModel *> *list = @[band1, band2, band3, band4, band5];
    return list;
}

@end
