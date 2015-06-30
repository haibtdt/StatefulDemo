//
//  ClientViewController.m
//  StatefullDemo
//
//  Created by Bui Hai on 6/30/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import "ClientViewController.h"
#import "SBViewStateMachine.h"

@interface ClientViewController ()
@property (nonatomic, strong) SBViewStateMachine* viewStateMachine;
@end

@implementation ClientViewController

-(void)viewDidLoad{

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.viewStateMachine = [SBViewStateMachine defaultViewStateMachineWithInitialView:self.view];
    [self.viewStateMachine moveToState:SBViewStateLoading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewStateMachine moveToState:SBViewStateError];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewStateMachine moveToState:SBViewStateLoading];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewStateMachine moveToState:SBViewStateInitial];
    });
}

@end
