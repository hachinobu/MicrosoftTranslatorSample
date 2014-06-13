//
//  HACTranslationResult.m
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/05/03.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACTranslationResult.h"
#import "MTAPIClient.h"
#import "XMLReader.h"

@interface HACTranslationResult ()

@property (copy, nonatomic, readwrite) NSString *from;
@property (copy, nonatomic, readwrite) NSString *to;
@property (copy, nonatomic, readwrite) NSString *text;
@property (copy, nonatomic, readwrite) NSString *result;

@end

@implementation HACTranslationResult

+ (instancetype)createTranslationResultWithToken:(NSString *)accessToken
                                            text:(NSString *)text
                                         Success:(void (^)(HACTranslationResult *))success
                                         failire:(void (^)(NSError *))failure
{
    HACTranslationResult *resultObj = [HACTranslationResult new];
    MTAPIClient *client = [MTAPIClient sharedClient];
    [client translationWithPath:@"/V2/Http.svc/Translate" accessToken:accessToken text:text success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSError *error;
        NSDictionary *resultDictionary = [XMLReader dictionaryForXMLData:responseObject error:&error];
        resultObj.from = @"";
        resultObj.to = @"";
        resultObj.text = text;
        resultObj.result = resultDictionary[@"string"][@"text"];
        
        if (success) {
            success(resultObj);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    
    return resultObj;
}

@end
