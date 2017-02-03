//
//  CartWireFrame.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CartWireFrame.h"
#import "CartPresenter.h"
#import "CartViewController.h"

@implementation CartWireFrame

+(void)configureView:(CartViewController *)view{
    CartPresenter *presenter = [[CartPresenter alloc] init];
    view.presenter = presenter;
    presenter.view = view;
}


@end
