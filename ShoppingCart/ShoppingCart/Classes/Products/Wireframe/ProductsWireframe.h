//
//  ProductsWireframe.h
//  ShoppingCart
//
//  Created by Jagtap, Amol  on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductsProtocols.h"
#import "ProductsViewController.h"

@interface ProductsWireframe : NSObject<ProductsWireframeProtocol>

+(void)configureView:(ProductsViewController *)view;

@end
