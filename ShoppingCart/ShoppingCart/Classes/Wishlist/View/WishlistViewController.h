//
//  WishlistViewController.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WishlistProtocols.h"
#import "WishlistTableViewCell.h"

@interface WishlistViewController : UIViewController<WishlistViewProtocol, UITableViewDelegate, UITableViewDataSource, WishlistTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<WishlistPresenterProtocol> presenter;

@property (nonatomic, strong) NSArray *products;

@end

