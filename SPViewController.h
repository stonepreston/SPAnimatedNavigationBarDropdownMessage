//
//  SPViewController.h
//  SPAnimatedNavigationBarDropdownMessage
//
//  Created by Stone  Preston on 4/6/14.
//  Copyright (c) 2014 Stone  Preston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPAnimatedNavigationBarDropdownMessage.h"

@interface SPViewController : UIViewController

@property (nonatomic, strong) SPAnimatedNavigationBarDropdownMessage *message;

- (IBAction)animateButtonPressed:(id)sender;

@end
