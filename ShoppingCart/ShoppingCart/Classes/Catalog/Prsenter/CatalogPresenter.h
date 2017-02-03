//
//  CatalogPresenter.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogProtocols.h"

@interface CatalogPresenter : NSObject <CatalogPresenterProtocol, CatalogInteractorOutputProtocol>

@property(nonatomic, strong) NSArray *products;

@property(nonatomic, weak) id<CatalogViewProtocol> view;
@property(nonatomic, strong) id<CatalogWireframeProtocol> wireframe;
@property(nonatomic, strong) id<CatalogInteractorInputProtocol> interactor;

@end
