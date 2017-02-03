//
//  CatalogWireFrame.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CatalogProtocols.h"

@interface CatalogWireFrame : NSObject<CatalogWireframeProtocol>

+(void)configureView:(UIViewController *)view;

@end
