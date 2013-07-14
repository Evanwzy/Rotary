//
//  RotaryNetworkingManager.m
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RotaryNetworkingManager.h"
#import "SBJson.h"
#import "Common.h"

#define NETWORK_QUEUE_CURRENT_OPERATION 1

@implementation RotaryNetworkingManager

@synthesize testDelegate =_testDelegate;
@synthesize firstDelegate=_firstDelegate;

#pragma - singleton

static RotaryNetworkingManager *_networkRequestManager;

+(RotaryNetworkingManager *)sharedManager {
    @synchronized(self){
        if (_networkRequestManager == nil) {
            _networkRequestManager = [[self alloc]init];
        }
    }
    return _networkRequestManager;
}

- (void)testNetWorking {
    [self checkQueue];
    
    NSURL *url=[NSURL URLWithString:@"http://yijianli.com/apps/index.php?s=/ApiCompany/index"];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    [request addPostValue:@"1" forKey:@"company"];
    request.delegate =self;
    request.didFinishSelector =@selector(testNetWorkingDone:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0f;
    
    [queue addOperation:request];
}

-(void)firstNetWorking{
    [self checkQueue];
    NSURL *url=[NSURL URLWithString:@"http://yijianli.com/apps/index.php?s=/ApiCompany/index"];
    ASIFormDataRequest *request=[[ASIFormDataRequest alloc]initWithURL:url];
    request.delegate=self;
    request.didFinishSelector=@selector(firstNetWorkingDone:);
    request.didFailSelector=@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds=5.0f;
//    [request startSynchronous];
    [queue addOperation:request];
}

-(void) firstNetWorkingDone:(ASIHTTPRequest *)request {
    NSString *str=[Common operaterStr:[request responseString]];
    NSDictionary *dic=[str JSONValue];
    [_firstDelegate firstQueryData:dic];
}

- (void)testNetWorkingDone :(ASIHTTPRequest *)request {
    NSString *str =[Common operaterStr:[request responseString]];
    NSDictionary *dict =[str JSONValue];
    [_testDelegate testQueryData:dict];
}


#pragma mark - Common methods
-(void)checkQueue{
    if (!queue) {
        queue = [[ASINetworkQueue alloc]init];
        [queue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [queue setShouldCancelAllRequestsOnFailure:NO];
        
        [queue go];
    }
}

-(void)checkSingleQueue{
    if (!singleQueue) {
        singleQueue = [[ASINetworkQueue alloc]init];
        [singleQueue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [singleQueue setShouldCancelAllRequestsOnFailure:NO];
        [singleQueue go];
    }
}

-(void)checkRemoteNotificationQueue{
    if (!remoteNotificationQueue) {
        remoteNotificationQueue = [[ASINetworkQueue alloc] init];
        [remoteNotificationQueue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [remoteNotificationQueue setShouldCancelAllRequestsOnFailure:NO];
        [remoteNotificationQueue go];
    }
}

- (void)commonRequestQueryDataFailed:(ASIHTTPRequest *)request {
    //new code 11.30 ???
    //    NSString *where = [request.userInfo objectForKey:@"where"];
    //    if ([where isEqualToString:@"shanghai"] || [where isEqualToString:@"banner"] || [where isEqualToString:@"shSub"]) {
    //        if (!shouldShowAlertAtHome) {
    //            return;
    //        } else {
    //            shouldShowAlertAtHome = NO;
    //        }
    //    }
    //
    //    //old code...
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"本次更新失败，请检查网络"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alertView show];
    NSLog(@"query data error: %@", [request error]);
}

- (void)dealloc {
    if (queue) {
        [queue cancelAllOperations];
    }
    
    if (remoteNotificationQueue) {
        [remoteNotificationQueue cancelAllOperations];
    }
    
    if(singleQueue){
        [singleQueue cancelAllOperations];
    }
}

#pragma mark - Common cancel

- (void)cancelAll{
    for (ASIHTTPRequest *request in [queue operations]) {
        [request cancel];
    }
}

@end
