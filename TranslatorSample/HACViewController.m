//
//  HACViewController.m
//  TranslatorSample
//
//  Created by Takahiro Nishinobu on 2014/03/23.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACViewController.h"
#import "MTOAuthAPIClient.h"
#import "MTAPIClient.h"
#import "TokenInfo.h"
#import "HACTranslationResult.h"

@interface HACViewController () {
    
}

@property (weak, nonatomic) IBOutlet UILabel *resultWordLabel;
@property (weak, nonatomic) IBOutlet UITextField *wordTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation HACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _resultWordLabel.text = @"";
}

- (IBAction)searchAction:(id)sender
{
    
    [TokenInfo createTokenInfoSuccess:^(TokenInfo *tokenInfo) {
        
        [HACTranslationResult createTranslationResultWithToken:tokenInfo.accessToken text:_wordTextField.text Success:^(HACTranslationResult *resultObj) {
            
            _resultWordLabel.text = resultObj.result;
            
        } failire:^(NSError *error) {
            
        }];
        
    } failire:^(NSError *error) {
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
