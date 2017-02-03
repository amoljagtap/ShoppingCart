//
//  Wishlist.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;

@interface ProductWrapper : NSObject

@property(nonatomic, strong) Product *product;
@property(nonatomic, assign) BOOL isAdded;

@end
