//
//  CollectionViewCell.m
//  ShoppingCart
//
//  Created by Jagtap, Amol (Cognizant) on 2/3/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CollectionViewCell.h"
#import "Product.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)updateView:(Product *)product{
    self.product = product;
    self.productName.text = product.name;
    self.price.text = [NSString stringWithFormat:@"Price: %@", [product.price stringValue]];
    if(product.stock == nil || [product.stock isKindOfClass:[NSNull class]] || product.stock.integerValue == 0){
        self.outOfStock.text = @"Out of stock";
        self.addToCartButton.hidden = YES;
        self.addToWishlistButton.hidden = YES;
    }else{
        self.outOfStock.text = [NSString stringWithFormat:@"In Stock: %@",[product.stock stringValue]];
        self.addToCartButton.hidden = NO;
        self.addToWishlistButton.hidden = NO;
    }
}


- (IBAction)addToWishlist:(id)sender {
    
    [self.delegate addProductToWishlist:self.product];
    
}

- (IBAction)addToCart:(id)sender {
    [self.delegate addProductToCart:self.product];
}


@end
