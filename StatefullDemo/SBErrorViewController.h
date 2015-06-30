//
//  SBErrorViewController.h
//  StatefullDemo
//
//  Created by Bui Hai on 6/30/15.
//  Copyright (c) 2015 Bui Hai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBErrorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *errorTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *retryButton;
@property (weak, nonatomic) IBOutlet UIImageView *errorImage;

@end
