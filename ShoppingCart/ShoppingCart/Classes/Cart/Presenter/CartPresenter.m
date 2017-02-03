//
//  CartPresenter.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CartPresenter.h"
#import "ProductManager.h"
#import "Product.h"

@implementation CartPresenter


-(void)getProducts{
    NSArray *cart = [ProductManager sharedInstance].cart;
    [self.view displayProducts:cart];
}

-(void)removeProductFromCart:(Product *)product{
    NSMutableArray *cart = [ProductManager sharedInstance].cart;
    if ([cart containsObject:product]){
        [cart removeObject:product];
        [self.view displayProducts:cart];
    }
}

-(NSInteger)getCartItemsCount{
    NSMutableArray *cart = [ProductManager sharedInstance].cart;
    return [cart count];
}

@end
