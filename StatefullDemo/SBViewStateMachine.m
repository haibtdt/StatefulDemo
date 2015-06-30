//
//  SBViewStateMachine.m
//  StatefullDemo
//
//  Created by Bui Hai on 6/29/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import "SBViewStateMachine.h"



@interface SBViewStateMachine()
@property (nonatomic, strong) NSMutableDictionary* allStateViews;

@end

@implementation SBViewStateMachine

-(instancetype)initWithInitialView:(UIView *)initialView{
    assert(initialView!= nil);
    self = [super init];
    if (self) {
        [self setView:initialView forState:SBViewStateInitial];
    }
    return self;
}

-(void)setView:(UIView *)view forState:(NSString *)stateName{
    if (_allStateViews == nil) {
        _allStateViews = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    [_allStateViews setValue:view forKey:stateName];
}


- (void)moveToState:(NSString *)stateName{
    UIView* viewToMoveTo = [self.allStateViews valueForKey:stateName];
    UIView* initialView = [self.allStateViews valueForKey:SBViewStateInitial];
    
    if (viewToMoveTo == nil) {
        NSLog(@"State does not exist!");
        return;
    }
    
    //remove other states
    for (UIView* stateView in self.allStateViews.allValues) {
        if (stateView != initialView) {
            [stateView removeFromSuperview];
        }
    }

    if (viewToMoveTo != initialView) {
        
        //configure the current state view and its layout constraints
        [initialView addSubview:viewToMoveTo];
        NSArray* constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[viewToMoveTo]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(viewToMoveTo)];
        [initialView addConstraints:constraints];
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[viewToMoveTo]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(viewToMoveTo)];
        [initialView addConstraints:constraints];
        
        NSLog(@"Moved to state: %@", stateName);
        
    }
}

@end
