//
//  URLSessionProtocol.h
//  ShoppingCart
//
//  Created by Jagtap, Amol (Cognizant) on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLSessionDataTaskProtocol <NSObject>

-(void)resume;

@end

@protocol URLSessionProtocol

-(id<URLSessionDataTaskProtocol>)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * data, NSURLResponse * response, NSError * error))completionHandler;

@end

@interface NSURLSession(Protocol)<URLSessionProtocol>

@end


@interface NSURLSessionDataTask(Protocol)<URLSessionDataTaskProtocol>

@end
