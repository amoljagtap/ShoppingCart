//
//  CatalogProtocols.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol CatalogViewProtocol <NSObject>

-(void)displayCatalogs:(NSArray *)catalogList;
-(void)showError:(NSString *)message;
    
@end


@protocol CatalogPresenterProtocol <NSObject>
    
-(void)fetchProducts;
-(void)displayProducts:(NSString *) category;

@end

@protocol CatalogInteractorInputProtocol <NSObject>


-(void)fetchProducts;

@end

@protocol CatalogInteractorOutputProtocol <NSObject>


-(void)provideProductDetails:(NSArray *)list error:(NSError *)error;

@end


@protocol ProductManagerProtocol <NSObject>

-(void)downloadProdcuts:(void(^)(NSArray *list, NSError *error))completionHandler;

@end

@protocol CatalogWireframeProtocol <NSObject>

-(void)showProducts:(NSString *)category fromView:(id)view;

@end
