//
//  ViewController.m
//  SDBaseRequestDemo
//
//  Created by Chausson on 16/5/31.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"
#import <CHNetworking/CHNetworking.h>
#import <CHNetworking/CHNetworking.h>
#import "SDBaseRequest.h"
static NSString *const Token = @"_MCH_AT=JbWnlHpgiY2usTdk1DGBnGzHk0pScgPUv9KTIVB9H5zaOe7UKGTYNxL5FKd1R4yahSP6lymUfjnt5JHnWRLgRQ2iDJkPlcuFf2KQbdgX%2BJVbX3HCW%2F6NSlatpn%2Fk7Ey9ZvMJehA0rx2eD2KdPo3Xhg%3D%3D";
@interface ViewController ()

@end

@implementation ViewController
- (void)configuration{
    [[CHNetworkConfig sharedInstance] setAllowPrintLog:YES];
    [[CHNetworkConfig sharedInstance] setBaseUrl:@"http://bbj.sudaotech.com/platform"];
    
    [[CHNetworkConfig sharedInstance] addheaderFieldParameter:@{@"token":Token}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configuration];
    [self testFeedBack];
}
- (void)testFeedBack {
//    SDSendCodeAPI *code = [[SDSendCodeAPI alloc]initWithCellPhone:@"18116342840"];
//    [code startWithSuccessBlock:^(__kindof SDFeedBackAPI *request) {
//        NSAssert(request.baseResponse.code != 200, @"反馈提交失败");
//    } failureBlock:^(__kindof CHBaseRequest *request) {
//        NSAssert(NO, @"服务器连接失败");
//    }];
    // 等待 时间 期望预期达成
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
