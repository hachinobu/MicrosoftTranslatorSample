//
//  MicrosoftTranslatorAPIClient.m
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/27.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "MTAPIClient.h"

static NSString * const MicrosoftTranslatorBaseURLString = @"http://api.microsofttranslator.com/";

@implementation MTAPIClient

+ (MTAPIClient *)sharedClient
{
    static MTAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:MicrosoftTranslatorBaseURLString]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (void)translationWithPath:(NSString *)path
                accessToken:(NSString *)accessToken
                       text:(NSString *)text
                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSDictionary *parameters = @{@"from": @"en",
                                 @"to": @"ja",
                                 @"text": text};
    NSString *authorizationValue = [NSString stringWithFormat:@"Bearer %@", accessToken];
    [self.requestSerializer setValue:authorizationValue forHTTPHeaderField:@"Authorization"];
    [self GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (success) {
            success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
}

@end
