//
//  DynamicFrame.h
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DynamicObject; //this fixes circular import issue

@interface PhysicsManager : NSObject

-(void) runAtFPS: (int) fps speed: (double) speed;
-(void) runAtFPS: (int) fps;
-(void) stop;
-(void) addObject:(DynamicObject *)object;
-(CGRect)limitRect: (CGRect) rect toBounds: (CGRect) otherRect;

@property NSMutableArray *objects;
@property double friction;

@end
