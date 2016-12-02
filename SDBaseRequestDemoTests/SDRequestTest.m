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

static NSString *const Token = @"_MCH_AT=JbWnlHpgiY2usTdk1DGBnGzHk0pScgPUv9KTIVB9H5zaOe7UKGTYNxL5FKd1R4yahSP6lymUfjnt5JHnWRLgRQ2iDJkPlcuFf2KQbdgX%2BJVbX3HCW%2F6NSlatpn%2Fk7Ey9ZvMJehA0rx2eD2KdPo3Xhg%3D%3D";

@interface SDRequestTest : XCTestCase

@end

@implementation SDRequestTest{
    NSURLSession *session;
}

- (void)setUp {
    [super setUp];
    [self configuration];


}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

}
- (void)configuration{
    [[CHNetworkConfig sharedInstance] setAllowPrintLog:YES];
    [[CHNetworkConfig sharedInstance] setBaseUrl:@"http://bbj.sudaotech.com/platform"];
    
    [[CHNetworkConfig sharedInstance] addheaderFieldParameter:@{@"token":Token}];
}

- (void)testFeedBack {
    XCTestExpectation *expectation = [self expectationWithDescription:@"异步加载FeedBack"];
    SDLoginAPI *login = [[SDLoginAPI alloc]initWithAccount:@"13761057550" password:@"111111"];
    [login startWithSuccessBlock:^(__kindof SDLoginAPI *request) {
        [expectation fulfill];
        XCTAssertEqual(request.baseResponse.code,200, "登录失败");        
    } failureBlock:^(__kindof CHBaseRequest *request) {
        [expectation fulfill];
        XCTFail("服务器请求失败");
 
    }];

//    // 等待 时间 期望预期达成
    [self waitForExpectationsWithTimeout:10 handler:nil];
}
//- (void)testDataTask
//{
//    XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];
//
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
//    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
//
//        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
//            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
//            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %lu", statusCode);
//        }
//
//        XCTAssert(data, @"data nil");
//
//        // do additional tests on the contents of the `data` object here, if you want
//
//        // when all done, Fulfill the expectation
//
//        [expectation fulfill];
//    }];
//    [task resume];
//
//    [self waitForExpectationsWithTimeout:10.0 handler:nil];
//}

@end
