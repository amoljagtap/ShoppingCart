//
//  ProductManager.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogProtocols.h"
#import "ServiceManager.h"

@protocol ProductJSONParserDelegate <NSObject>

-(void)parseProductsData:(NSData *)data completionHandler:(void (^)(NSArray *, NSError *))completionHandler;

@end

@interface ProductManager : NSObject <ProductManagerProtocol, ProductJSONParserDelegate>

@property (nonatomic, strong) NSArray *products;
@property(nonatomic, strong) id<ServiceManagerDelegate> delegate;
@property (nonatomic, strong) NSMutableSet *wishList;
@property (nonatomic, strong) NSMutableArray *cart;

+(ProductManager *)sharedInstance;
-(NSArray *)getProducts:(NSString *)category;
-(Product *)getProductDetails:(NSString *)productId;
-(NSArray *)getCatalog:(NSArray *)list;

@end
