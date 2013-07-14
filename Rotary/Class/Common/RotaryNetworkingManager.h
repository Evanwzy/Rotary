//
//  RotaryNetworkingManager.h
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"

@protocol NetworkingRequestManagerTestDelegate;
@protocol NetworkingRequestManagerFirstDelegate;

@interface RotaryNetworkingManager : NSObject {
    ASINetworkQueue *queue;
    ASINetworkQueue *singleQueue;
    ASINetworkQueue *remoteNotificationQueue;
    //NSOperationQueue *queue;
}

@property (assign, nonatomic) id<NetworkingRequestManagerTestDelegate> testDelegate;

@property (assign, nonatomic) id<NetworkingRequestManagerFirstDelegate> firstDelegate;

- (void)testNetWorking;
- (void)firstNetWorking;

@property (nonatomic, retain) ASINetworkQueue *queue;
@property (nonatomic, retain) ASINetworkQueue *singleQueue;
@property (nonatomic, retain) ASINetworkQueue *remoteNotificationQueue;

+ (RotaryNetworkingManager *)sharedManager;

@end

@protocol NetworkingRequestManagerTestDelegate <NSObject>

- (void)testQueryData:(NSDictionary *)dict;
@end

@protocol NetworkingRequestManagerFirstDelegate <NSObject>

- (void)firstQueryData:(NSDictionary *)dict;
@end
