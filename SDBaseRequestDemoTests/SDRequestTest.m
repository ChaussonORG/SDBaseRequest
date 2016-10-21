//
//  SDRequestTest.m
//  SDBaseRequestDemo
//
//  Created by Chausson on 16/10/19.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CHNetworking/CHNetworking.h>
#import "SDBaseRequest.h"

static NSString *const tvToken = @"_MCH_AT=JbWnlHpgiY2usTdk1DGBnGzHk0pScgPUv9KTIVB9H5zaOe7UKGTYNxL5FKd1R4yahSP6lymUfjnt5JHnWRLgRQ2iDJkPlcuFf2KQbdgX%2BJVbX3HCW%2F6NSlatpn%2Fk7Ey9ZvMJehA0rx2eD2KdPo3Xhg%3D%3D";

@interface SDRequestTest : XCTestCase

@end

@implementation SDRequestTest

- (void)setUp {
    [super setUp];


}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self configuration];

}
- (void)configuration{
    [[CHNetworkConfig sharedInstance] setAllowPrintLog:YES];
    [[CHNetworkConfig sharedInstance] setBaseUrl:@"http://app4tv.sudaotech.com/platform"];
    
    [[CHNetworkConfig sharedInstance] addheaderFieldParameter:@{@"cooki":tvToken}];
}

- (void)testFeedBack {

    SDFeedBackAPI *feed = [[SDFeedBackAPI alloc]initWithTitle:@"测试建议" content:@"很多建议"];

    [self measureBlock:^{

        [feed startWithSuccessBlock:^(__kindof CHBaseRequest *request) {
            assert(request.response.statusCode == 200);
            
        } failureBlock:^(__kindof CHBaseRequest *request) {
            
        }];
    }];
}
- (void)testAuthor{
    SDAuthorLoginAPI *author = [[SDAuthorLoginAPI alloc]initWithOpenID:@"oDI30wQxGqxIpTKRqfG_0-N5Nauw" accessToken:@"OezXcEiiBSKSxW0eoylIeLQXuZGnVpKMZJpEI0Of620d_S_clsucD-mtGU6aPaDoGLn0ouGyQuDLHO10-1o7oIHq_lgdM_SfmFnUeyPtt2DTvqo9yOPKI3FkRmcyE-ai_uRLgooVeGRo9CqOQeD7ag" type:SDAuthorWeChat];

    [self measureBlock:^{

        [author startWithSuccessBlock:^(__kindof SDAuthorLoginAPI *request) {
            assert(request.response.statusCode == 200);
        } failureBlock:^(__kindof SDAuthorLoginAPI *request) {
            
        }];
    }];

}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
