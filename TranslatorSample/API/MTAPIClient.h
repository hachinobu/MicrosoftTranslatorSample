//
//  MicrosoftTranslatorAPIClient.h
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/27.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface MTAPIClient : AFHTTPSessionManager

+ (MTAPIClient *)sharedClient;

- (void)translationWithPath:(NSString *)path
                accessToken:(NSString *)accessToken
                       text:(NSString *)text
                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
