//
//  CatalogViewController.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatalogProtocols.h"

@interface CatalogViewController : UIViewController <CatalogViewProtocol, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) id<CatalogPresenterProtocol> presenter;
@property (nonatomic, strong) NSArray *catalog;

@end

