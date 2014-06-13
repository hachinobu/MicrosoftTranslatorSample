//
//  TokenInfo.m
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/30.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "TokenInfo.h"
#import "MTOAuthAPIClient.h"

@interface TokenInfo ()

@property (copy, nonatomic, readwrite) NSString *accessToken;
@property (copy, nonatomic, readwrite) NSString *tokenType;
@property (copy, nonatomic, readwrite) NSString *expiresIn;
@property (copy, nonatomic, readwrite) NSString *scope;

@end

@implementation TokenInfo

+ (instancetype)createTokenInfoSuccess:(void (^)(TokenInfo *))success
                               failire:(void (^)(NSError *))failure
{
    TokenInfo *tokenInfo = [TokenInfo new];
    MTOAuthAPIClient *oAuthClient = [MTOAuthAPIClient sharedClient];
    [oAuthClient authenticateUsingOAuthWithPath:@"/v2/OAuth2-13/" success:^(NSURLSessionDataTask *task, id responseDictionary) {
        
        tokenInfo.accessToken = responseDictionary[@"access_token"];
        tokenInfo.tokenType = responseDictionary[@"tokenType"];
        tokenInfo.expiresIn = responseDictionary[@"expires_in"];
        tokenInfo.scope = responseDictionary[@"scope"];
        if (success) {
            success(tokenInfo);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    return tokenInfo;
}

@end
