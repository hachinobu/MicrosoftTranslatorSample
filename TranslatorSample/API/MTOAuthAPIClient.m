//
//  MTOAuthAPIClient.m
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/30.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "MTOAuthAPIClient.h"

static NSString * const MicrosoftTranslatorAuthenticateBaseURLString = @"https://datamarket.accesscontrol.windows.net/";

//Get Client Id and Client Secret from https://datamarket.azure.com/developer/applications/
// clientIDには、事前にマイクロソフトへ登録した「クライアントID」を設定。
// client secretには、事前にマイクロソフトへ登録した「顧客の秘密」を設定。
static NSString * const MicrosoftTranslatorClientId = @"xxxx";
static NSString * const MicrosoftTranslatorClientSecret = @"xxxx";

@implementation MTOAuthAPIClient

+ (MTOAuthAPIClient *)sharedClient
{
    static MTOAuthAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:MicrosoftTranslatorAuthenticateBaseURLString]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        
    }
    return self;
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                               success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                               failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
//    self.session.configuration.HTTPAdditionalHeaders = @{@"Content-Type": @"application/x-www-form-urlencoded"};
    
    NSDictionary *parameters = @{@"client_id": MicrosoftTranslatorClientId,
                                 @"client_secret": MicrosoftTranslatorClientSecret,
                                 @"scope": @"http://api.microsofttranslator.com",
                                 @"grant_type": @"client_credentials"};
    
    [self POST:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
