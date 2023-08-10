//
//  BandListViewModel.h
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 11/07/2023.
//

// LastFMViewModel.h

// LastFMViewModel.h

#import <Foundation/Foundation.h>

@class ArtistInfo, ArtistBio, LastFMImage;

@interface LastFMViewModel : NSObject

@property (nonatomic, strong, nullable) NSString *apiKey;

@property (nonatomic, strong, nullable) NSMutableArray<ArtistInfo *> *artistInfoArray;

@property (nonatomic, copy) NSString * _Nullable name;
@property (nonatomic, strong) ArtistBio * _Nullable bio;
@property (nonatomic, copy, nullable) NSString *mbid;
@property (nonatomic, strong) NSArray<LastFMImage *> * _Nullable image;
@property (nonatomic, copy) NSString * _Nullable url;


- (void)getArtistInfo:(NSString *_Nullable)artistName completionHandler:(void (^_Nullable)(NSError *_Nullable error))completionHandler;

@end
