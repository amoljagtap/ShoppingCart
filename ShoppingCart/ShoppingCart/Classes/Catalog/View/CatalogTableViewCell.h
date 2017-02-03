//
//  CatalogTableViewCell.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *kCatalogTableViewReusableCell;

@interface CatalogTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *CatalogImageView;
@property (weak, nonatomic) IBOutlet UILabel *catalogTitleLabel;

@end
