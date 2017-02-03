//
//  WishlistTableViewCell.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

extern NSString *kWishlistTableViewCell;

@protocol WishlistTableViewCellDelegate <NSObject>

-(void)addToCart:(Product *)product;

@end

@interface WishlistTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@property (strong, nonatomic) Product *product;
@property (weak, nonatomic) id<WishlistTableViewCellDelegate> delegate;

-(void)updateView:(Product *)product;

@end
