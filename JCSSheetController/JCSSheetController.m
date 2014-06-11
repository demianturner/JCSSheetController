//
//  JCSSheetController.m
//
//  Created by Abizer Nasir on 19/02/11.
//  Based on SDSheetController by Steven Degutis https://github.com/sdegutis/SDSheetController
//

#import "JCSSheetController.h"

@interface JCSSheetController ()

@property (nonatomic, copy) JCSCompletionHandler handler;
- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(NSUInteger)returnCode contextInfo:(void *)contextInfo;

@end

@implementation JCSSheetController

- (void)beginSheetModalForWindow:(NSWindow *)window withMessage:(NSString *)message completionHandler:(JCSCompletionHandler)aHandler {
    self.message = message;
    self.handler = aHandler;
    
    [self sheetWillDisplay];
    
    [NSApp beginSheet:self.window modalForWindow:window modalDelegate:self didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:) contextInfo:NULL];
    
    [self sheetDidDisplay];
}

- (void)endSheetWithReturnCode:(NSUInteger)result {
    [NSApp endSheet:[self window] returnCode:result];
}

- (void)sheetWillDisplay {
    // Default does nothing.
    // Convenience for subclasses to override.
}

- (void)sheetDidDisplay {
    // Convenience for subclasses to override.
    self.messageLabel.stringValue = self.message;
}

// Mark: -
// Mark: Class Extension methods

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(NSUInteger)returnCode contextInfo:(void *)contextInfo {
    [sheet orderOut:self];
    
    if (self.handler) {
        self.handler(returnCode);
    }
}

@end
