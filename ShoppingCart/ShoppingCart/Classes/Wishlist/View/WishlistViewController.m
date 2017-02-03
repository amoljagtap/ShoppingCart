//
//  WishlistViewController.m
//  ShoppingCart
//
//  Created by Jagtap, Amol  on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "WishlistViewController.h"
#import "Product.h"
#import "WishlistWireFrame.h"
#import "CartViewController.h"

@interface WishlistViewController ()

@end

@implementation WishlistViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [WishlistWireFrame configureView:self];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Wishlist";
    
    UINib *nib = [UINib nibWithNibName:kWishlistTableViewCell bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kWishlistTableViewCell];
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if (editing){
        self.tableView.editing = YES;
    }else{
        self.tableView.editing = NO;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.presenter getProducts];
}

-(void)displayProducts:(NSArray *)products{

    self.products = products;
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.products count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WishlistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWishlistTableViewCell forIndexPath:indexPath];
    Product *product = [self.products objectAtIndex:indexPath.row];
    [cell updateView:product];
    cell.delegate = self;
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.presenter removeProductFromWishlist:[self.products objectAtIndex:indexPath.row]];
    }
}

-(void)addToCart:(Product *)product{
    [self.presenter addProductToCart:product];
    [self.tableView reloadData];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Product added to Cart." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}


@end
