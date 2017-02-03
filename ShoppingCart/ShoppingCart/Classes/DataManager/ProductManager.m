//
//  ProductManager.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "ProductManager.h"
#import "Product.h"

@implementation ProductManager

@synthesize delegate;
@synthesize products;
@synthesize  wishList;
@synthesize cart;

NSString * const ProductsUrl = @"https://s3.amazonaws.com/active-tools/products.json";

+(ProductManager *)sharedInstance{
    static ProductManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ProductManager alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.wishList = [[NSMutableSet alloc] init];
        self.cart = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)downloadProdcuts:(void (^)(NSArray *, NSError *))completionHandler{
    __weak ProductManager *weakSelf = self;
    [delegate downalodProductsData:[NSURL URLWithString:ProductsUrl] completionHandler:^(NSData *data, NSError *error) {
        if (error != nil) {
            completionHandler(nil,error);
        }else {
            [weakSelf parseProductsData:data completionHandler:^(NSArray *list, NSError *error) {
                completionHandler(list, nil);
            }];
        }
        
    }];
    
}


-(void)parseProductsData:(NSData *)data completionHandler:(void (^)(NSArray *, NSError *))completionHandler{
    NSError *error;
    NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error!= nil) {
        completionHandler(nil, error);
    }else{
        NSMutableArray *productsArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in jsonArray) {
            if (dict != nil) {
                Product *product = [[Product alloc] init];
                product.productId = [dict objectForKey:@"productId"];
                product.category = [dict objectForKey:@"category"];
                product.name = [dict objectForKey:@"name"];
                product.oldPrice = [dict objectForKey:@"oldPrice"];
                product.price = [dict objectForKey:@"price"];
                product.stock = [dict objectForKey:@"stock"];
                [productsArray addObject:product];
            }
        }
        [self setCurrentProducts:productsArray];
        completionHandler(products,nil);
    }
}

-(void)setCurrentProducts:(NSArray *)productsArray{
    self.products = productsArray;
}

-(NSArray *)getProducts:(NSString *)category{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", category];
    NSArray *filtered = [self.products filteredArrayUsingPredicate:predicate];
    return  filtered;
}

-(Product *)getProductDetails:(NSString *)productId{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productId == %@", productId];
    Product *product = [[self.products filteredArrayUsingPredicate:predicate] firstObject];
    return product;
}

-(NSArray *)getCatalog:(NSArray *)list{
    NSArray *catalog = [list valueForKeyPath:@"@distinctUnionOfObjects.category"];
    return catalog;
}

@end
