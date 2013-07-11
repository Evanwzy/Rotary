//
//  RotaryNetworkingManager.m
//  Rotary
//
//  Created by Evan on 13-7-9.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RotaryNetworkingManager.h"

@implementation RotaryNetworkingManager

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

@end
