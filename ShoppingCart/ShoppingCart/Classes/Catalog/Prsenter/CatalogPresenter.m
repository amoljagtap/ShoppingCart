//
//  CatalogPresenter.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CatalogPresenter.h"

@implementation CatalogPresenter

@synthesize products;
@synthesize view;
@synthesize wireframe;
@synthesize interactor;

-(void)fetchProducts{
    
    [interactor fetchProducts];

}
    
-(void)provideProductDetails:(NSArray *)list error:(NSError *)error{

    if (error != nil ){
        [view showError:@"Error occurred while downloading products. Please try again later!!!"];
    }else{
        [view displayCatalogs:list];
    }

}


-(void)displayProducts:(NSString *)category{
    [self.wireframe showProducts:category fromView:view];
}

@end
