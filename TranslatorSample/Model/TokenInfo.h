//
//  TokenInfo.h
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/04/30.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TokenInfo : NSObject

@property (copy, nonatomic, readonly) NSString *accessToken;
@property (copy, nonatomic, readonly) NSString *tokenType;
@property (copy, nonatomic, readonly) NSString *expiresIn;
@property (copy, nonatomic, readonly) NSString *scope;

+ (instancetype)createTokenInfoSuccess:(void (^)(TokenInfo *))success
                               failire:(void (^)(NSError *))failure;

@end
