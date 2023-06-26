//
//  BandModel.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 15/06/2023.
//

#import <Foundation/Foundation.h>

@interface BandModel : NSObject

@property (nonatomic, strong) NSString *profilePic;
@property (nonatomic, strong) NSString *bandName;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *bandDescription;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, strong) NSString *originCountry;

- (instancetype)initWithProfilePic:(NSString *)profilePic
                          bandName:(NSString *)bandName
                             genre:(NSString *)genre
                   bandDescription:(NSString *)bandDescription
                         startDate:(NSString *)startDate
                     originCountry:(NSString *)originCountry;

+ (NSArray<BandModel *> *)getList;

@end
