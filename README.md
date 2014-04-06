#  SPAnimatedNavigationBarDropdownMessage

A class for displaying a short message that drops down from a navigation bar 

![SPAnimatedNavigationBarDropdownMessage Screenshot](https://raw.githubusercontent.com/stonepreston/SPAnimatedNavigationBarDropdownMessage/master/ScreenShot.png)

## Installation

Manual: add SPAnimatedNavigationBarDropdownMessage.h and SPAnimatedNavigationBarDropdownMessage.m to your project and import the .h file

## Usage

You can create SPAnimatedNavigationBarDropdownMessage a property in your viewController's .h file

`@property (nonatomic, strong) SPAnimatedNavigationBarDropdownMessage *message;`

then alloc and initialize it in your viewController's viewDidLoad method

```
//if you dont set this to no, the dropdown view is visible behind the navigation bar when not in use.
self.navigationController.navigationBar.translucent = NO;
    
self.message = [[SPAnimatedNavigationBarDropdownMessage alloc] initWithHeight:20.0f andParentNavigationBar:self.navigationController.navigationBar];
```

and call the following method when you want to animate the message

`[self.message animateDropdownMessageWithText:@"This is a message" durationDown:1.0 delay:10.0 durationUp:1.0];`

