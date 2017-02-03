//
//  CartViewController.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartProtocols.h"

@interface CartViewController : UIViewController<CartViewProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

@property(nonatomic, strong) NSArray *products;

@property(nonatomic, strong) id<CartPresenterProtocol> presenter;

-(void)updateCartBadge;

@end
