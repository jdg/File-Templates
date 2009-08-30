//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//

«OPTIONALHEADERIMPORTLINE»
#import "AppDelegate.h"
#import "Constants.h"

#define RESULTS_PER_PAGE    20

@implementation «FILEBASENAMEASIDENTIFIER»

- (void) tableViewDidLoadModel:(UITableView *)tableView {
	if (!_items) {
		_items = [[NSMutableArray array] retain];
	}

	[_items removeAllObjects];

	NSMutableArray *results = [self.model results];

	if ([results count] == 0) {
		[super tableViewDidLoadModel:tableView];
		return;
	}

	for (NSDictionary *result in results) {
    // Add to self.items
	}

	if ([self.model hasMoreToLoad]) {
    [self.items addObject:[TTTableMoreButton itemWithText:[NSString stringWithFormat:@"Load %d more", RESULTS_PER_PAGE]
													 subtitle:[self.model remainingToLoad]]];

	}

	[super tableViewDidLoadModel:tableView];
}

@end