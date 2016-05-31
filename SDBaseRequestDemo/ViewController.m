//
//  ViewController.m
//  SDBaseRequestDemo
//
//  Created by Chausson on 16/5/31.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"
#import <CHNetworking/CHNetworking.h>
#define TV_TOKEN @"_MCH_AT=g0OMd0RxpmEz94EFa3Nob9uLTJ3AvWI%2Fixq4zRdUY2wjFl1nXeGkjvNF35A%2Fj0FjSQ33Bfq6i4%2FjBifDi99JXTs8QyY5kXHyxaM1WePka4N6Hcq4b2XsszMXRJo646THVodPbI%2FqmpJZDyXXIAO0cw%3D%3D"
#import "SDFeedBackAPI.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[CHNetworkConfig sharedInstance] setAllowPrintLog:YES];
    [[CHNetworkConfig sharedInstance] setBaseUrl:@"http://app4tv.sudaotech.com/platform"];
    [[CHNetworkConfig sharedInstance] addheaderFieldParameter:@{@"Cookie":TV_TOKEN}];
    SDFeedBackAPI *feed = [[SDFeedBackAPI alloc]initWithTitle:@"" content:@"很多建议"];
    [feed startWithSuccessBlock:^(__kindof SDFeedBackAPI *request) {
        NSLog(@"content = %@ code = %lu",request.content,request.baseResponse.code);
    } failureBlock:^(__kindof CHBaseRequest *request) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
