//
//  SPAnimatedNavigationBarDropdownMessage.h
//  SPAnimatedNavigationBarDropdownMessage
//
//  Created by Stone  Preston on 4/6/14.
//  Copyright (c) 2014 Stone  Preston. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPAnimatedNavigationBarDropdownMessage : NSObject

@property (nonatomic) float dropdownHeight;

//the dropdown view
@property (strong,nonatomic) UIView *dropdownView;

//used to display the text of the message
@property (strong,nonatomic) UILabel *dropdownLabel;

//the navigation bar the dropdownBelongs to
@property (strong, nonatomic) UINavigationBar *parentNavigationBar;

//used to determine if a dropdown is currently animating or not
@property(nonatomic, assign) BOOL isAnimating;

- (id)initWithHeight:(float)height andParentNavigationBar:(UINavigationBar *)navigationBar;

//durationDown is how long it takes to animate down, duration up is how long it takes to animate up, and delay is how long it stays stil before animating back up
- (void)animateDropdownMessageWithText:(NSString *)text durationDown:(float)duration delay:(float)delay durationUp:(float)durationUp;



@end