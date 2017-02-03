//
//  CollectionViewCell.h
//  ShoppingCart
//
//  Created by Jagtap, Amol (Cognizant) on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Product;

@protocol CollectionViewCellDelegate <NSObject>

-(void)addProductToWishlist:(Product *)product;
-(void)removeProductToWishlist:(Product *)product;
-(void)addProductToCart:(Product *)product;

@end

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *outOfStock;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addToWishListButtonHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addToCartButtonHeightConstarint;
@property (weak, nonatomic) IBOutlet UIButton *addToWishlistButton;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;

@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) Product *product;

@property (weak, nonatomic) id<CollectionViewCellDelegate> delegate;

-(void)updateView:(Product *)product;



@end
