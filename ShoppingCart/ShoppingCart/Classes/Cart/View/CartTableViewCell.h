//
//  WishlistTableViewCell.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

extern NSString *kCartTableViewCell;


@interface CartTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
