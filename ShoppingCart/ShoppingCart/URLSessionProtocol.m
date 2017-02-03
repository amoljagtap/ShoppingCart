//
//  URLSessionProtocol.m
//  ShoppingCart
//
//  Created by Jagtap, Amol (Cognizant) on 2/2/17.
//  Copyright © 2017 Amol Jagtap. All rights reserved.
//

#import "URLSessionProtocol.h"

@implementation NSURLSession(Protocol)

-(id<URLSessionDataTaskProtocol>)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * data, NSURLResponse * response, NSError * error))completionHandler{
    
    return [self dataTaskWithURL:url completionHandler:completionHandler];
}

@end


@implementation NSURLSessionDataTask(Protocol)

@end
