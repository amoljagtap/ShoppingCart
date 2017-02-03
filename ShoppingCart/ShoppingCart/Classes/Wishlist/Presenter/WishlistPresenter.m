//
//  WishlistPresenter.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "WishlistPresenter.h"
#import "ProductManager.h"
#import "Product.h"


@implementation WishlistPresenter


-(void)getProducts{
    NSArray *wishlistProducts = [[ProductManager sharedInstance].wishList allObjects];
    [self.view displayProducts:wishlistProducts];
}

-(void)addProductToCart:(Product *)product{
    NSMutableSet *products = [ProductManager sharedInstance].wishList;
    NSMutableArray *cart = [ProductManager sharedInstance].cart;
    if ([products containsObject:product]){
        [products removeObject:product];
        [cart addObject:product];
        [self.view displayProducts:products.allObjects];
    }
}

-(void)removeProductFromWishlist:(Product *)product{
    NSMutableSet *products = [ProductManager sharedInstance].wishList;
    if ([products containsObject:product]){
        [products removeObject:product];
        [self.view displayProducts:products.allObjects];
    }
}

@end
