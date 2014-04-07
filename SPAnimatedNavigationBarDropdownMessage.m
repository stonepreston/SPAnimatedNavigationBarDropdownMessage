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
        
        _parentNavigationBar = navigationBar;
        
        //set the frame where the dropdown will be "hiding"
        _dropdownView = [[UIView alloc] initWithFrame:CGRectMake(_parentNavigationBar.frame.origin.x, _parentNavigationBar.frame.size.height - height, _parentNavigationBar.frame.size.width, height)];
        
        //set the height property equal to the height passed in as the frame (this is used in animation calculations)
        _dropdownHeight = height;
        
        //set the default color of the dropdownView to red
        _dropdownView.backgroundColor = [UIColor redColor];
        
        //set the label frame
        _dropdownLabel = [[UILabel alloc] initWithFrame:_dropdownView.bounds];
        
        //set the text alignment for the label to center
        _dropdownLabel.textAlignment = NSTextAlignmentCenter;
        
        //set the font  and font size of the label
        _dropdownLabel.font = [UIFont boldSystemFontOfSize:14];
        
        //set the default text color of the label to white
        _dropdownLabel.textColor = [UIColor whiteColor];
        
        //set the labels background color to clear
        _dropdownLabel.backgroundColor = [UIColor clearColor];
        
        //not animating initially
        _isAnimating = NO;
        
        //add label as a subview of the dropdown view
        [_dropdownView addSubview:self.dropdownLabel];
        
        [_parentNavigationBar addSubview:self.dropdownView];
        
        [_parentNavigationBar sendSubviewToBack:self.dropdownView];
        
    }
    return self;
    
    
}

-(id)init {
    
    return [self initWithHeight:20 andParentNavigationBar:nil];
}






- (void)animateDropdownMessageWithText:(NSString *)text durationDown:(float)durationDown delay:(float)delay durationUp:(float)durationUp {
    
    if (self.isAnimating == NO) {
        
        self.isAnimating = YES;
        self.dropdownLabel.text = text;
        
        [UIView animateWithDuration:durationDown delay:0 options:0 animations:^{
            
            self.dropdownView.frame = CGRectMake(self.parentNavigationBar.frame.origin.x, self.parentNavigationBar.frame.size.height, self.parentNavigationBar.frame.size.width, self.dropdownHeight);
            
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:durationUp delay:delay options:0 animations:^{
                
                self.dropdownView.frame = CGRectMake(self.parentNavigationBar.frame.origin.x, self.parentNavigationBar.frame.size.height - self.dropdownHeight, self.parentNavigationBar.frame.size.width, self.dropdownHeight);
                
            } completion:^(BOOL finished) {
                
                //animation finished!!!
                self.isAnimating = NO;
                
            }];
            ;
        }];
        
    }
 
}

@end


