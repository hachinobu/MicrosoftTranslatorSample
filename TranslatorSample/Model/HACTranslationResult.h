//
//  HACTranslationResult.h
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/05/03.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HACTranslationResult : NSObject

@property (copy, nonatomic, readonly) NSString *from;
@property (copy, nonatomic, readonly) NSString *to;
@property (copy, nonatomic, readonly) NSString *text;
@property (copy, nonatomic, readonly) NSString *result;

+ (instancetype)createTranslationResultWithToken:(NSString *)accessToken
                                            text:(NSString *)text
                                         Success:(void (^)(HACTranslationResult *))success
                                         failire:(void (^)(NSError *))failure;

@end
