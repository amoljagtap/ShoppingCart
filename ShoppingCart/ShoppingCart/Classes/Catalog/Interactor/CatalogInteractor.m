//
//  CatalogInteractor.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CatalogInteractor.h"
#import "ProductManager.h"

@implementation CatalogInteractor

@synthesize productManager;
@synthesize presenter;

-(void)fetchProducts {

    __weak CatalogInteractor *weakSelf = self;
    [productManager downloadProdcuts:^(NSArray *list, NSError *error) {
        NSArray *catalogs = [weakSelf getCatalog:list];
        [presenter provideProductDetails:catalogs error:error];
    }];
}

-(NSArray *)getCatalog:(NSArray *)list {
    
    return [[ProductManager sharedInstance] getCatalog:list];

}

@end
