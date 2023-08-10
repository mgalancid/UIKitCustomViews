//
//  BandListViewModel.m
//  UIKitCustomViews
//
//  Created by Lautaro Galan on 11/07/2023.
//

// LastFMViewModel.m

#import "LastFMViewModel.h"
#import "UIKitCustomViews-Swift.h"

@implementation LastFMViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadApiKeyFromCredentials];
        self.artistInfoArray = [NSMutableArray array]; // Inicializa el array aquí
    }
    return self;
}

- (void)loadApiKeyFromCredentials {
    // Cargar la clave API desde el archivo Credentials.plist
    NSString *credentialsPath = [[NSBundle mainBundle] pathForResource:@"Credentials" ofType:@"plist"];
    NSDictionary *credentials = [NSDictionary dictionaryWithContentsOfFile:credentialsPath];
    self.apiKey = credentials[@"api_key"];
}

- (void)getArtistInfo:(NSString *)artistName completionHandler:(void (^_Nullable)(NSError *_Nullable error))completionHandler {
    // Crear una instancia de APIManager con tu clave API
    APIManager *apiManager = [[APIManager alloc] initWithApiKey:self.apiKey];
    
    // Llamar al método para obtener la información del artista utilizando el nombre del artista
    [apiManager fetchArtistInfoWithArtistName:artistName completion:^(ArtistInfo * _Nullable artistInfo, NSError * _Nullable error) {
        if (error) {
            if (completionHandler) {
                completionHandler(error);
            }
        } else {
            // Agregar artistInfo al array
            [self.artistInfoArray addObject:artistInfo];
            
            if (completionHandler) {
                completionHandler(nil);
            }
            
            // Ejemplo de cómo acceder a las propiedades de ArtistInfo
            NSLog(@"Nombre del artista: %@", artistInfo.name);
            NSLog(@"URL del artista: %@", artistInfo.url);
        }
    }];
}

@end
