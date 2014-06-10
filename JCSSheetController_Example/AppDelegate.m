//
//  JCSSheetController_ExampleAppDelegate.m
//  JCSSheetController_Example
//
//  Created by Abizer Nasir on 19/02/2011.
//  Copyright 2011 Jungle Candy Software. All rights reserved.
//

#import "AppDelegate.h"
#import "SheetController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.sheetController = [[SheetController alloc] init];
}

- (void)showSheet:(id)sender {
    NSLog(@"Button clicked");
    
    NSString *message = [NSString stringWithFormat:@"Are you sure you want to delete this user?"];
    [_sheetController beginSheetModalForWindow:[NSApp keyWindow] withMessage:message completionHandler:^(NSUInteger returnCode) {
        if (returnCode == kSheetReturnedOk) {
            NSLog(@"ok");
        } else if (returnCode == kSheetReturnedCancel) {
            NSLog(@"cancelled");
        }
    }];
    
}

@end
