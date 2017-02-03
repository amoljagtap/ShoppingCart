//
//  ProductsPresenter.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductsProtocols.h"

@interface ProductsPresenter : NSObject <ProductsPresenterProtocol>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, weak) id<ProductsViewProtocol> view;
@property (nonatomic, strong) id<ProductsWireframeProtocol> wireframe;

@end
