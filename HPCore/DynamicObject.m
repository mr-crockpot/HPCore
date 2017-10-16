//
//  DynamicObject.m
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "DynamicObject.h"
#import <UIKit/UIKit.h>

@implementation DynamicObject

-(DynamicObject *) initWithView: (UIView *) view vector: (Vector *) vector container: (UIView *) container manager: (PhysicsManager *) manager {
    self.view = view;
    self.container = container;
    self.vector = vector;
    self.manager = manager;
    return self;
}

-(int)view: (CGRect) r1 isOutsideOf: (CGRect) r2 {
    if ((r1.origin.x < r2.origin.x) || (r1.origin.x + r1.size.width  > r2.origin.x + r2.size.width))
        return 1;
    if ((r1.origin.y < r2.origin.y) || (r1.origin.y + r1.size.height > r2.origin.y + r2.size.height))
        return 2;
    return 0;
}

-(void)stepTime: (double) time {
    CGRect c = self.view.frame;
    CGRect n = CGRectMake(c.origin.x + _vector.x * time, c.origin.y + _vector.y * time, c.size.width, c.size.height);
    _vector.x *= _manager.friction * time;
    _vector.y *= _manager.friction * time;
    int f = [self view:n isOutsideOf:_container.frame];
    if (f)
        n = [_manager limitRect:n toBounds:_container.frame];
    if (f==1)
        _vector.x *= -1;
    if (f==2)
        _vector.y *= -1;
    [self.view setFrame: n];
    
}

@end
