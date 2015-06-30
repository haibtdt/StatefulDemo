//
//  SBDefaultViewStateMachine.m
//  StatefullDemo
//
//  Created by Bui Hai on 6/30/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import "SBDefaultViewStateMachine.h"

@interface SBDefaultViewStateMachine()

@property (nonatomic, strong) SBErrorViewController* errorStateViewController;
@property (nonatomic, strong) SBLoadingViewController* loadingStateViewController;


@end

@implementation SBDefaultViewStateMachine


+ (SBDefaultViewStateMachine *)defaultViewStateMachineWithInitialView:(UIView *)view {
    SBDefaultViewStateMachine* viewStateMachine = [[SBDefaultViewStateMachine alloc] initWithInitialView:view];
    
    
    //configure defaults
    NSBundle* thisBundle = [NSBundle bundleForClass:[SBViewStateMachine class]];
    UIStoryboard* bundledStoryboard = [UIStoryboard storyboardWithName:@"SBViewState" bundle:thisBundle];
    viewStateMachine.errorStateViewController = [bundledStoryboard instantiateViewControllerWithIdentifier:@"SBErrorViewController"];
    [viewStateMachine setView:viewStateMachine.errorStateViewController.view
                     forState:SBViewStateError];
    
    viewStateMachine.loadingStateViewController = [bundledStoryboard instantiateViewControllerWithIdentifier:@"SBLoadingViewController"];
    [viewStateMachine setView:viewStateMachine.loadingStateViewController.view forState:SBViewStateLoading];
    
    return viewStateMachine;
}



@end
