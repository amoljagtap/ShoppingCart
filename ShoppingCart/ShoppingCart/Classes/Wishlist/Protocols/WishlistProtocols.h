//
//  WishlistProtocols.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol WishlistViewProtocol

-(void)displayProducts:(NSArray *)products;

@end

@protocol WishlistWireframeProtocol


@end

@protocol WishlistPresenterProtocol

-(void)getProducts;
-(void)removeProductFromWishlist:(Product *)product;
-(void)addProductToCart:(Product *)product;

@end
