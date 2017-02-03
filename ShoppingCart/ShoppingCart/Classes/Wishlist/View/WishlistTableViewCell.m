//
//  WishlistTableViewCell.m
//  ShoppingCart
//
//  Created by Jagtap, Amol  on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "WishlistTableViewCell.h"
#import "Product.h"

NSString *kWishlistTableViewCell = @"WishlistTableViewCell";

@implementation WishlistTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)updateView:(Product *)product{
    self.product = product;
    self.nameLabel.text = product.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addToCart:(id)sender {

    [self.delegate addToCart:self.product];
    
}

@end
