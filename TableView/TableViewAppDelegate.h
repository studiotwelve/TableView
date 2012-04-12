//
//  TableViewAppDelegate.h
//  TableView
//
//  Created by Michael Hurley on 4/11/12.
//  Copyright (c) 2012 Hurley's LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TableViewAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

#pragma mark
#pragma mark ====== Classes ======
@property (retain) NSMutableArray *theDataSource;
@property (retain) NSImage *theStatusImage;

#pragma mark
#pragma mark ====== Outlets ======
@property (assign) IBOutlet NSTableView *aTableView;
@property (assign) IBOutlet NSTextField *bookTitleField;
@property (assign) IBOutlet NSTextField *authorField;
@property (assign) IBOutlet NSMatrix	*statusField;

#pragma mark
#pragma mark ====== Values ======
@property (copy) NSString *theAuthor;
@property (copy) NSString *bookTitle;
@property (copy) NSNumber *theStatus;

@end
