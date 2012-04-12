//
//  TableViewAppDelegate.m
//  TableView
//
//  Created by Michael Hurley on 4/11/12.
//  Copyright (c) 2012 Hurley's LLC. All rights reserved.
//

#import "TableViewAppDelegate.h"

@implementation TableViewAppDelegate

@synthesize window = _window;

#pragma mark
#pragma mark ====== Classes ======
@synthesize theDataSource = _theDataSource;
@synthesize theStatusImage = _theStatusImage;

#pragma mark
#pragma mark ====== Outlets ======
@synthesize aTableView = _aTableView;
@synthesize bookTitleField = _bookTitleField;
@synthesize authorField = _authorField;
@synthesize statusField = _statusField;

#pragma mark
#pragma mark ====== Values ======
@synthesize theAuthor = _theAuthor;
@synthesize bookTitle = _bookTitle;
@synthesize theStatus = _theStatus;

#pragma mark
#pragma mark ====== Actions ======
-(IBAction)addData:(id)sender {
	//if ([_theStatus stringValue] == @"") { [_theStatus setValue:0]; } //Just in case
	
	NSString *bookTitle = @"bookTitle";
	NSString *theAuthor = @"theAuthor";
	NSString *theStatus = @"theStatus";
	
	NSDictionary *newData = [NSDictionary dictionaryWithObjectsAndKeys:_bookTitle, bookTitle, _theAuthor, theAuthor, _theStatus, theStatus, nil];
	
	[_theDataSource addObject:newData];
	
	[_aTableView reloadData];
	
	[_bookTitleField setStringValue:@""];
	[_authorField setStringValue:@""];
	[_statusField setIntValue:0];
	
	[_window makeFirstResponder:_bookTitleField];
}

#pragma mark
#pragma mark ====== TableView ======
-(id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)column row:(NSInteger)row {
	if ([_theDataSource count] == 0) {
		return NULL;
	}
	
	NSString *ident = [column identifier];
	NSDictionary *theRecord = [_theDataSource objectAtIndex:row];
	NSString *theValue = [theRecord objectForKey:ident];
	
	if ([ident isEqualToString:@"theStatus"]) {
		if ([theValue intValue] == 0) {
			theValue = [NSImage imageNamed:@"green"];
		} else {
			theValue = [NSImage imageNamed:@"red"];
		}
	}
	
	return theValue;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
	return [_theDataSource count];
}

- (void)tableView:(NSTableView *)aTableView sortDescriptorsDidChange:(NSArray *)oldDescriptors {
	NSArray *sortDesc = [aTableView sortDescriptors];
	[_theDataSource sortUsingDescriptors:sortDesc];
	[aTableView reloadData];
}

#pragma mark
#pragma mark ====== Application ======
- (void)awakeFromNib {
	NSMutableArray *theDataSource = [[NSMutableArray alloc] init];
	
	NSString *bookTitle = @"bookTitle";
	NSString *theAuthor = @"theAuthor";
	NSString *theStatus = @"theStatus";
	
	NSDictionary *theData = [NSDictionary dictionaryWithObjectsAndKeys:
						@"A Christmas Carol", bookTitle, @"Charles Dickens", theAuthor, 1, theStatus,
						@"The Adventures of Huckleberry Finn", bookTitle, @"Mark Twain", theAuthor, 1, theStatus,
						@"The Adventures of Tom Sawyer", bookTitle, @"Mark Twain", theAuthor, 0, theStatus,
						@"War and Peace", bookTitle, @"Leo Tolstoy", theAuthor, 0, theStatus, nil];
	
	[theDataSource addObject:theData];
	[_aTableView reloadData];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {}

@end
