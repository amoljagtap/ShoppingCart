//
//  ProductsViewController.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "ProductsViewController.h"
#import "Product.h"
#import "ProductsWireframe.h"
#import "CartViewController.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController

@synthesize products;
@synthesize presenter;

NSString *kCollectionViewCell = @"CollectionViewCell";

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [ProductsWireframe configureView:self];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Clothes";
    
    [self.collectionView registerNib:[UINib nibWithNibName:kCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kCollectionViewCell];
    
    [self.presenter getProducts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayProducts:(NSArray *)products{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.products = products;
        [self.collectionView reloadData];
    });
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.products count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCell forIndexPath:indexPath];
    Product *product = [self.products objectAtIndex:indexPath.row];
    [cell updateView:product];
    cell.delegate = self;
    return cell;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(155.0, 285.0);
}

-(void)addProductToCart:(Product *)product{
    [self.presenter addProductToCart:product];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Product added to Cart." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)addProductToWishlist:(Product *)product{
    [self.presenter addProductToWishlist:product];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Product added in Wishlist." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
