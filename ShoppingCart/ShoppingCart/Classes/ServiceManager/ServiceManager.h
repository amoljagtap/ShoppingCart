//
//  ServiceManager.h
//  ShoppingCart
//
//  Created by Jagtap, Amol on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceManagerDelegate <NSObject>

-(void)downalodProductsData:(NSURL *)url completionHandler:(void (^) (NSData *data, NSError *error))completionBlock;

@end

@interface ServiceManager : NSObject<ServiceManagerDelegate>

@property (weak, nonatomic) id<ServiceManagerDelegate> delegate;
@property (nonatomic, strong) NSURLSession *urlSession;


+(ServiceManager *)sharedInstance;

/**
 Initializes object with NSURLSession
 
 @param session NSURLSession object
 @return instance of class
 */
-(id)initWithSession:(NSURLSession *)session;

@end
