//
//  DynamicFrame.m
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "PhysicsManager.h"
#import "DynamicObject.h"
#import "Vector.h"
#import <UIKit/UIKit.h>

@implementation PhysicsManager

bool _stopped = false;
NSTimer *_timer;
double _scaling;
double _speed;

-(PhysicsManager *) init {
    self.objects = [[NSMutableArray alloc] init];
    return self;
}

-(void) addObject:(DynamicObject *)object {
    [_objects addObject:object];
}

-(void) stepTime:(double) time {
    for (DynamicObject *object in _objects) {
        [object stepTime:time * _scaling];
    }
}

-(void) step {
    [self stepTime:1];
}


-(void) runAtFPS: (int) fps speed: (double) speed{
    _scaling = (1.0f/fps) * speed;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_scaling repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self stepTime:1];
    }];
}

-(void) runAtFPS: (int) fps {
    [self runAtFPS:fps speed:1];
}

-(void) stop {
    [_timer invalidate];
}


@end
