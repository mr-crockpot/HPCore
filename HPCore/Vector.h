//
//  Vector.h
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector : NSObject

-(Vector *) initWithX: (double) x Y: (double) y;


@property double x;
@property double y;

@end

