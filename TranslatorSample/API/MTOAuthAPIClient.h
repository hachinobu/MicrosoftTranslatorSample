//
//  MTOAuthAPIClient.h
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/30.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface MTOAuthAPIClient : AFHTTPSessionManager

+ (MTOAuthAPIClient *)sharedClient;

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                               success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                               failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
