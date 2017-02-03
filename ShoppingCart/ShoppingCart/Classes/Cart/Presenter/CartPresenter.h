//
//  CartPresenter.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartProtocols.h"

@interface CartPresenter : NSObject<CartPresenterProtocol>

@property(nonatomic, weak) id<CartViewProtocol> view;

@end
