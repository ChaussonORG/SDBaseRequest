//
//  ViewController.m
//  SDBaseRequestDemo
//
//  Created by Chausson on 16/5/31.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"
#import <CHNetworking/CHNetworking.h>
#define TV_TOKEN @"_MCH_AT=JbWnlHpgiY2usTdk1DGBnGzHk0pScgPUv9KTIVB9H5zaOe7UKGTYNxL5FKd1R4yahSP6lymUfjnt5JHnWRLgRQ2iDJkPlcuFf2KQbdgX%2BJVbX3HCW%2F6NSlatpn%2Fk7Ey9ZvMJehA0rx2eD2KdPo3Xhg%3D%3D"
#import "SDBaseRequest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[CHNetworkConfig sharedInstance] setAllowPrintLog:YES];
    [[CHNetworkConfig sharedInstance] setBaseUrl:@"http://app4tv.sudaotech.com/platform"];
    [[CHNetworkConfig sharedInstance] addheaderFieldParameter:@{@"cookie":TV_TOKEN}];
    SDFeedBackAPI *feed = [[SDFeedBackAPI alloc]initWithTitle:@"" content:@"很多建议"];
    [feed startWithSuccessBlock:^(__kindof SDFeedBackAPI *request) {
      //  NSLog(@"content = %@ code = %lu",request.content,request.baseResponse.code);
    } failureBlock:^(__kindof CHBaseRequest *request) {
        
    }];
    SDAuthorLoginAPI *author = [[SDAuthorLoginAPI alloc]initWithOpenID:@"oDI30wQxGqxIpTKRqfG_0-N5Nauw" accessToken:@"OezXcEiiBSKSxW0eoylIeLQXuZGnVpKMZJpEI0Of620d_S_clsucD-mtGU6aPaDoGLn0ouGyQuDLHO10-1o7oIHq_lgdM_SfmFnUeyPtt2DTvqo9yOPKI3FkRmcyE-ai_uRLgooVeGRo9CqOQeD7ag" type:SDAuthorWeChat];
    [author startWithSuccessBlock:^(__kindof SDAuthorLoginAPI *request) {
        NSLog(@"author data = %@ code = %lu",request.baseResponse.data,request.baseResponse.code);
    } failureBlock:^(__kindof SDAuthorLoginAPI *request) {
        NSLog(@"error = %@",request.response.error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
