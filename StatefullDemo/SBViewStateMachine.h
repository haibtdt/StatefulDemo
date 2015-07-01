//
//  SBViewStateMachine.h
//  StatefullDemo
//
//  Created by Bui Hai on 6/29/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SBViewStateError @"errorView"
#define SBViewStateLoading @"loadingView"
#define SBViewStateInitial @"initialView"

@interface SBViewStateMachine : NSObject

-(void) setView:(UIView*) view forState:(NSString*) stateName;
-(void) moveToState:(NSString*) stateName;
@property (nonatomic, readonly) NSDictionary* allStateViews;
-(instancetype) initWithInitialView:(UIView*) initialView;



@end
