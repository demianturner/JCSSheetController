//
//  JCSSheetController.h
//  
//  Created by Abizer Nasir on 19/02/11.
//  Based on SDSheetController by Steven Degutis https://github.com/sdegutis/SDSheetController
// 
//  Requires Garbage Collection to be turned on.
//  A basic window controller subclass that wraps a sheet callback in a block.
//

#import <Cocoa/Cocoa.h>

typedef void (^JCSCompletionHandler)(NSUInteger result);

@interface JCSSheetController : NSWindowController 

@property(nonatomic, weak) IBOutlet NSTextField *messageLabel;
@property(nonatomic, weak) NSString *message;

- (void)beginSheetModalForWindow:(NSWindow *)window withMessage:(NSString *)message completionHandler:(JCSCompletionHandler)aHandler;

// Convenience methods for subclasses to use
- (void)endSheetWithReturnCode:(NSUInteger)result;
- (void)sheetWillDisplay; // Default does nothing
- (void)sheetDidDisplay;

@end
