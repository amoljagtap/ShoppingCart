//
//  ProductsProtocols.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol ProductsViewProtocol

-(void)displayProducts:(NSArray *)products;

@end

@protocol ProductsWireframeProtocol

-(void)showProductDetails:(Product *)product fromView:(id)view;

@end

@protocol ProductsPresenterProtocol

-(void)setCategory:(NSString *)categoryName;
-(void)getProducts;
-(void)addProductToCart:(Product *)product;
-(void)addProductToWishlist:(Product *)product;

@end
