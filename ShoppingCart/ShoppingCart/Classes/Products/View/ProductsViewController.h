//
//  ProductsViewController.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductsProtocols.h"
#import "CollectionViewCell.h"

@interface ProductsViewController : UIViewController <ProductsViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, CollectionViewCellDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) id<ProductsPresenterProtocol> presenter;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *products;

@end
