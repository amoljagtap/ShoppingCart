//
//  Product.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, strong) NSString* productId;
@property (nonatomic, strong) NSNumber* stock;
@property (nonatomic, strong) NSString* category;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSNumber* oldPrice;
@property (nonatomic, strong) NSNumber* price;

@end
