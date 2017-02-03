//
//  WishlistWireFrame.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "WishlistWireFrame.h"
#import "WishlistViewController.h"
#import "WishlistPresenter.h"

@implementation WishlistWireFrame

+(void)configureView:(WishlistViewController *)view{
    WishlistPresenter *presenter = [[WishlistPresenter alloc] init];
    view.presenter = presenter;
    presenter.view = view;
}


@end
