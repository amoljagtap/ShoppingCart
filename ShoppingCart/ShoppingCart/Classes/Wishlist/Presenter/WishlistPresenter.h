//
//  WishlistPresenter.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WishlistProtocols.h"

@interface WishlistPresenter : NSObject<WishlistPresenterProtocol>

@property(nonatomic, weak) id<WishlistViewProtocol> view;
//@property (nonatomic, strong) NSArray *wishlistProducts;

@end
