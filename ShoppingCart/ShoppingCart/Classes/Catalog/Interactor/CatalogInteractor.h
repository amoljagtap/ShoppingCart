//
//  CatalogInteractor.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogProtocols.h"

@interface CatalogInteractor : NSObject <CatalogInteractorInputProtocol>


@property (nonatomic, strong) id<ProductManagerProtocol> productManager;
@property (nonatomic, weak) id<CatalogInteractorOutputProtocol> presenter;

@end
