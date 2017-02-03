//
//  ProductsWireframe.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "ProductsWireframe.h"
#import "ProductsPresenter.h"

@implementation ProductsWireframe

+(void)configureView:(ProductsViewController *)view{
    ProductsPresenter *presenter = [[ProductsPresenter alloc] init];
    ProductsWireframe *wireframe = [[ProductsWireframe alloc] init];
    
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireframe = wireframe;
}



-(void)showProductDetails:(Product *)product fromView:(id)view{
    
    if ([view isKindOfClass:[ProductsViewController class]]){
        ProductsViewController *sourceView = (ProductsViewController *) view;
//        [sourceView.navigationController pushViewController: animated:<#(BOOL)#>]
    }
    
    
}

@end
