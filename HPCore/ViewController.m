//
//  ViewController.m
//  HPCore
//
//  Created by Adam Schor on 10/15/17.
//  Copyright © 2017 AandA Development. All rights reserved.
//

#import "ViewController.h"
#import "Vector.h"
#import "DynamicObject.h"
#import "GrabbableObject.h"
#import "PhysicsManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    v.layer.backgroundColor = [[UIColor redColor] CGColor];
    [self.view addSubview:v];
    Vector *r = [[Vector alloc] initWithX:200 Y:100];
    GrabbableObject *d = [[GrabbableObject alloc] initWithView:v vector:r container:self.view];
    PhysicsManager *f = [[PhysicsManager alloc] init];
    [f addObject:d];
    [f runAtFPS:64];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
