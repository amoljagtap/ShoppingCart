//
//  ProductsPresenter.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "ProductsPresenter.h"
#import "ProductManager.h"
#import "ProductWrapper.h"

@implementation ProductsPresenter

@synthesize categoryName;
@synthesize products;

-(void)setCategory:(NSString *)categoryName{
    self.categoryName = categoryName;
}

-(void)getProducts{
    self.products = [[ProductManager sharedInstance] getProducts:self.categoryName];
    [self.view displayProducts:products];
}

-(void)addProductToWishlist:(Product *)product{
    [[ProductManager sharedInstance].wishList addObject:product];
}

-(void)addProductToCart:(Product *)product{
    [[ProductManager sharedInstance].cart addObject:product];
}

@end
