//
//  SPAnimatedNavigationBarDropdownMessage.m
//  SPAnimatedNavigationBarDropdownMessage
//
//  Created by Stone  Preston on 4/6/14.
//  Copyright (c) 2014 Stone  Preston. All rights reserved.
//

#import "SPAnimatedNavigationBarDropdownMessage.h"

@implementation SPAnimatedNavigationBarDropdownMessage

- (id)initWithHeight:(float)height andParentNavigationBar:(UINavigationBar *)navigationBar {
    
    self = [super init];
    if (self) {
        //perform initial setup of the dropdown
        
        self.parentView = navigationBar;
        
        //set the frame where the dropdown will be "hiding"
        self.dropdownView = [[UIView alloc] initWithFrame:CGRectMake(self.parentView.frame.origin.x, self.parentView.frame.size.height - height, self.parentView.frame.size.width, height)];
        
        //set the height property equal to the height passed in as the frame (this is used in animation calculations)
        self.dropdownHeight = height;
        
        //set the default color of the dropdownView to red
        self.dropdownView.backgroundColor = [UIColor redColor];
        
        //set the label frame
        self.dropdownLabel = [[UILabel alloc] initWithFrame:self.dropdownView.bounds];
        
        //set the text alignment for the label to center
        self.dropdownLabel.textAlignment = NSTextAlignmentCenter;
        
        //set the font  and font size of the label
        self.dropdownLabel.font = [UIFont boldSystemFontOfSize:14];
        
        //set the default text color of the label to white
        self.dropdownLabel.textColor = [UIColor whiteColor];
        
        //set the labels background color to clear
        self.dropdownLabel.backgroundColor = [UIColor clearColor];
        
        //not animating initially
        self.isAnimating = NO;
        
        //add label as a subview of the dropdown view
        [self.dropdownView addSubview:self.dropdownLabel];
        
        [self.parentView addSubview:self.dropdownView];
        
        [self.parentView sendSubviewToBack:self.dropdownView];
        
    }
    return self;
    
    
}

- (void)animateDropdownMessageWithText:(NSString *)text durationDown:(float)durationDown delay:(float)delay durationUp:(float)durationUp {
    
    if (self.isAnimating == NO) {
        
        self.isAnimating = YES;
        self.dropdownLabel.text = text;
        
        [UIView animateWithDuration:durationDown delay:0 options:0 animations:^{
            
            self.dropdownView.frame = CGRectMake(self.parentView.frame.origin.x, self.parentView.frame.size.height, self.parentView.frame.size.width, self.dropdownHeight);
            
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:durationUp delay:delay options:0 animations:^{
                
                self.dropdownView.frame = CGRectMake(self.parentView.frame.origin.x, self.parentView.frame.size.height - self.dropdownHeight, self.parentView.frame.size.width, self.dropdownHeight);
                
            } completion:^(BOOL finished) {
                
                //animation finished!!!
                self.isAnimating = NO;
                
            }];
            ;
        }];
        
    }
 
}

@end


