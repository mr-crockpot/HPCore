//
//  GrabbableObject.m
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "GrabbableObject.h"

@implementation GrabbableObject

UILongPressGestureRecognizer *_touch;
NSMutableArray *_touchPositionsX;
NSMutableArray *_touchPositionsY;

-(DynamicObject *) initWithView: (UIView *) view vector: (Vector *) vector container: (UIView *) container manager:(PhysicsManager *)manager{
    self = [super initWithView:view vector:vector container:container manager:manager];
    _touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(grab:)];
    [self.view addGestureRecognizer:_touch];
    _touch.minimumPressDuration = 0.0;
    _touchPositionsX = [[NSMutableArray alloc] init];
    _touchPositionsY = [[NSMutableArray alloc] init];
    return self;
}

-(void)grab: (UIGestureRecognizer *)tapRecognizer{
    CGPoint c = [tapRecognizer locationInView:self.container];
    if (tapRecognizer.state == UIGestureRecognizerStateBegan) {
        self.vector = [[Vector alloc] initWithX:0 Y:0];
    }
    
    if (tapRecognizer.state == UIGestureRecognizerStateChanged) {
        CGRect n = CGRectMake(c.x - (self.view.frame.size.width  / 2),
                                     c.y - (self.view.frame.size.height / 2),
                                     self.view.frame.size.width,
                                     self.view.frame.size.height);
        n = [self.manager limitRect:n toBounds:self.container.frame];

        
        [self.view setFrame: n];
        [_touchPositionsX addObject:[NSNumber numberWithFloat:c.x]];
        [_touchPositionsY addObject:[NSNumber numberWithFloat:c.y]];
        if (_touchPositionsX.count > 10) {
            [_touchPositionsX removeObjectAtIndex:0];
            [_touchPositionsY removeObjectAtIndex:0];
        }
        
        
    }
    
    if (tapRecognizer.state == UIGestureRecognizerStateEnded) {
        double dx = [((NSNumber *)_touchPositionsX[_touchPositionsX.count - 1]) doubleValue] -
                                             [((NSNumber *)_touchPositionsX[0]) doubleValue];
        double dy = [((NSNumber *)_touchPositionsY[_touchPositionsY.count - 1]) doubleValue] -
                                             [((NSNumber *)_touchPositionsY[0]) doubleValue];
        dy *= 4;
        self.vector = [[Vector alloc] initWithX:dx Y:dy];
        
        //self.vector = [[Vector alloc] initWithX:0 Y:-300];
        
    }}


@end
