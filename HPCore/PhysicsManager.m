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
    self.friction = 1;
    return self;
}

-(void) addObject:(DynamicObject *)object {
    [_objects addObject:object];
}

-(void) stepTime:(double) time {
    for (DynamicObject *object in _objects) {
        [object stepTime:time * _scaling];
        object.vector.x *= (1-(_friction * time * _scaling));
        object.vector.y *= (1-(_friction * time * _scaling));
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

#pragma mark UTILS

-(CGRect)limitRect: (CGRect) rect toBounds: (CGRect) otherRect {

    if (rect.origin.x < otherRect.origin.x){
        rect.origin.x = otherRect.origin.x;
    }
    if (rect.origin.y < otherRect.origin.y){
        rect.origin.y = otherRect.origin.y;
    }
    if (rect.origin.x + rect.size.width > otherRect.origin.x + otherRect.size.width) {
        rect.origin.x = otherRect.origin.x + otherRect.size.width - rect.size.width;
    }
    if (rect.origin.y + rect.size.height > otherRect.origin.y + otherRect.size.height) {
        rect.origin.y = otherRect.origin.y + otherRect.size.height - rect.size.height;
    }

    return rect;
}


@end
