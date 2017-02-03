//
//  CatalogViewController.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "CatalogViewController.h"
#import "CatalogWireFrame.h"
#import "CatalogTableViewCell.h"

@interface CatalogViewController ()

@end

@implementation CatalogViewController

@synthesize presenter;
@synthesize catalog;


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [CatalogWireFrame configureView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Catelog";
    
    UINib *nib = [UINib nibWithNibName:kCatalogTableViewReusableCell bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kCatalogTableViewReusableCell];
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.activityIndicatorView startAnimating];
    [self.presenter fetchProducts];
   
}

-(void)getProducts{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}

-(void)displayCatalogs:(NSArray *)catalogList{
    NSLog(@"%@", catalogList);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activityIndicatorView stopAnimating];
        self.catalog = catalogList;
        [self.tableView reloadData];
    });

}

-(void)showError:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];
    [self presentViewController:alert animated:true completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma MARK TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.catalog count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CatalogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCatalogTableViewReusableCell forIndexPath:indexPath];
    cell.catalogTitleLabel.text = [self.catalog objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self.presenter displayProducts:[self.catalog objectAtIndex:indexPath.row]];
}

@end
