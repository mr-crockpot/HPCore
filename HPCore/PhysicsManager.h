//
//  DynamicFrame.h
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DynamicObject.h"

@interface PhysicsManager : NSObject

-(void) runAtFPS: (int) fps speed: (double) speed;
-(void) runAtFPS: (int) fps;
-(void) stop;
-(void) addObject:(DynamicObject *)object;

@property NSMutableArray *objects;
@end
