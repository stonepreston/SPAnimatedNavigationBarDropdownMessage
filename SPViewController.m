//
//  SPViewController.m
//  SPAnimatedNavigationBarDropdownMessage
//
//  Created by Stone  Preston on 4/6/14.
//  Copyright (c) 2014 Stone  Preston. All rights reserved.
//

#import "SPViewController.h"


@interface SPViewController ()

@end

@implementation SPViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //if you dont set this to no, the dropdown view is visible behind the navigation bar when not in use.
	self.navigationController.navigationBar.translucent = NO;
    
    self.message = [[SPAnimatedNavigationBarDropdownMessage alloc] initWithHeight:20.0f andParentNavigationBar:self.navigationController.navigationBar];
}



- (IBAction)animateButtonPressed:(id)sender {
    
    [self.message animateDropdownMessageWithText:@"This is a message" durationDown:1.0 delay:10.0 durationUp:1.0];
}
@end
