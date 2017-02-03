//
//  CartViewController.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CartViewController.h"
#import "CartWireFrame.h"
#import "CartTableViewCell.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [CartWireFrame configureView:self];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Cart";
    
    UINib *nib = [UINib nibWithNibName:kCartTableViewCell bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kCartTableViewCell];
    self.tableView.estimatedRowHeight = 50;
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
    [self updateCartBadge];
    [self.presenter getProducts];
}

-(void)displayProducts:(NSArray *)products{
    
    CGFloat totalPrice = 0;
    
    for (Product *item in products) {
        totalPrice += [item.price floatValue];
    }
    self.totalPriceLabel.text = [NSString stringWithFormat:@"Total Price: %0.2f",totalPrice];
    self.products = products;
    [self.tableView reloadData];
    
}

-(void)updateCartBadge{
    NSInteger count = [self.presenter getCartItemsCount];
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%ld",(long)count]];
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
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCartTableViewCell forIndexPath:indexPath];
    Product *product = [self.products objectAtIndex:indexPath.row];
    cell.nameLabel.text = product.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"Price: %@",[product.price stringValue]];
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
        [self.presenter removeProductFromCart:[self.products objectAtIndex:indexPath.row]];
    }
}


@end
