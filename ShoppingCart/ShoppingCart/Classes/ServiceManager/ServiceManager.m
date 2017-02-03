//
//  ServiceManager.m
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "ServiceManager.h"

@implementation ServiceManager

@synthesize urlSession;

+(ServiceManager *)sharedInstance{
    static ServiceManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ServiceManager alloc] init];
    });
    return sharedInstance;
}

/**
 Initializes instance of class with default session
 
 @return instance of CLPNetworkManager
 */
-(id)init{
    self = [super init];
    if (self){
        NSURLSessionConfiguration* conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:conf];
    }
    return self;
}

/**
 Initializes object with NSURLSession
 
 @param session NSURLSession object
 @return instance of CLPNetworkManager
 */
-(id)initWithSession:(NSURLSession *)session{
    self = [super init];
    if (self){
        self.urlSession = session;
    }
    return self;
}

-(void)downalodProductsData:(NSURL *)url completionHandler:(void (^)(NSData *, NSError *))completionBlock{
    [[urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completionBlock(data, error);
    }] resume];
}

@end
