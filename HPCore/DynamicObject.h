//
//  DynamicObject.h
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Vector.h"
#import "PhysicsManager.h"

@interface DynamicObject : NSObject
-(DynamicObject *) initWithView: (UIView *) view vector: (Vector *) vector container: (UIView *) container manager: (PhysicsManager *) manager;
-(void)stepTime: (double) time;

@property UIView *view;
@property Vector *vector;
@property BOOL *edgeCollide;
@property UIView *container;
@property PhysicsManager *manager;

@end
