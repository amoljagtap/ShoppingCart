//
//  CartProtocols.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"

@protocol CartViewProtocol

-(void)displayProducts:(NSArray *)products;

@end

@protocol CartWireframeProtocol


@end

@protocol CartPresenterProtocol

-(void)getProducts;
-(void)removeProductFromCart:(Product *)product;
-(NSInteger)getCartItemsCount;

@end
