//
//  SDRegisterAPI.m
//  FrameWorkPractice
//
//  Created by Chausson on 16/5/26.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "SDRegisterAPI.h"

@interface SDRegisterAPI()

@property (nonatomic , strong) NSString *invitationCode;

@property (nonatomic , strong) NSString *invitationCodeKey;
@end
@implementation SDRegisterAPI
- (instancetype)initWithAccount:(NSString *)account
                       password:(NSString *)password
                      phoneCode:(NSString *)code{
    self = [super init];
    if (self) {
        NSAssert(account.length > 0 && password.length > 0 && code.length > 0, @"account or password or code is nil");
        _code = code;
        _account = account;
        _password = password;
    }
    return self;
}

- (void)fetchInvitationCode:(NSString *)invitationCode invitationCodeKey:(NSString *)invitationCodeKey{
    
    _invitationCode = invitationCode;
    
    _invitationCodeKey = invitationCodeKey;
    
}
- (NSDictionary *)requestParameter{
    
    NSMutableDictionary *paraDic = [NSMutableDictionary dictionary];
    
    [paraDic setObject:self.account forKey:@"cellphone"];
    [paraDic setObject:self.password forKey:@"password"];
    [paraDic setObject:self.code forKey:@"phoneCode"];
    
    if (self.invitationCode) {
        [paraDic setObject:self.invitationCode forKey:self.invitationCodeKey];
    }
    return paraDic;
}
- (CHRequestMethod)requestMethod{
    return CHRequestMethodPost;
}
- (NSString *)requestPathUrl{
    return @"/app/register";
}
- (void)requestCompletionBeforeBlock{
    _baseResponse = [[SDBaseResponse alloc]initWithJSON:self.response.responseJSONObject];
}
- (NSString *)token{
    
    if ([self.response.responseJSONObject objectForKey:@"data"] ) {
        return [self.response.responseJSONObject objectForKey:@"data"];
    }else{
        return nil;
    }
}
@end
