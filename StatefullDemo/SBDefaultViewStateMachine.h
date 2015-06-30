//
//  SBDefaultViewStateMachine.h
//  StatefullDemo
//
//  Created by Bui Hai on 6/30/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import "SBViewStateMachine.h"

@interface SBDefaultViewStateMachine : SBViewStateMachine


#pragma mark - Defaults
+ (SBDefaultViewStateMachine*) defaultViewStateMachineWithInitialView:(UIView*) view;
@property (nonatomic, readonly) SBErrorViewController* errorStateViewController;
@property (nonatomic, readonly) SBLoadingViewController* loadingStateViewController;


@end
