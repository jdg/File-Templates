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

@synthesize objects;

- (id) init {
	if (self = [super init]) {
		self.objects = [[[NSMutableArray alloc] init] autorelease];
	}
	return self;
}

- (void) dealloc {
	self.objects = nil;
	[super dealloc];
}

- (void) load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {	
	NSString *remoteURL = nil;

	if (!more) {
		recordOffset = 1;
		if ([objects count] > 0) {
			self.objects = [[[NSMutableArray alloc] init] autorelease];
		}
    remoteURL = @"http://replaceme"
	} else {
		recordOffset += 1;
		remoteURL = [NSString stringWithFormat:@"%@/?page=%d", @"replaceme", recordOffset];
	}

	TTURLRequest *request = [TTURLRequest requestWithURL:remoteURL delegate:self];
	request.cachePolicy = TTURLRequestCachePolicyNone;
	request.response = [[[TTURLDataResponse alloc] init] autorelease]; 
	request.httpMethod = @"POST";

	[request send];
}

- (BOOL) hasMoreToLoad {
	if ([objects count] < RESULTS_PER_PAGE)
		return NO;
	if ([objects count] >= totalRecords)
		return NO;

	return YES;
}

- (NSString *) loadMoreDescription {
	if ([objects count] - totalRecords >= RESULTS_PER_PAGE) {
    return [NSString stringWithFormat:@"Load %d more", RESULTS_PER_PAGE];
	}

	return [NSString stringWithFormat:@"Load %d more", ([objects count] - totalRecords)];
}

- (NSString *) remainingToLoad {
	return [NSString stringWithFormat:@"Displaying %d of %d", [objects count], totalRecords];
}

- (void) reset {
	[super reset];
	[objects removeAllObjects];
}

- (NSMutableArray *)results {
	return [[[self objects] copy] autorelease];
}

- (void) requestDidFinishLoad:(TTURLRequest*)request {
	TTURLDataResponse *response = request.response;
	NSString *error;
	NSPropertyListFormat format;
	id plist;
	
	plist = [NSPropertyListSerialization propertyListFromData:response.data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
	if (!plist) {  
		NSLog(@"Error reading plist from file error = '%s'", [error UTF8String]);  
		[error release];
		return;
	}
	
	NSLog(@"%@ response is: %@", self, plist);

	if ([plist count] > 0) {
		totalRecords = [[[plist objectAtIndex:0] objectForKey:@"total_results"] integerValue];

		if ([plist count] == 1 && [[plist objectAtIndex:0] isKindOfClass:[NSString class]]) {

		} else {
			[plist removeObjectAtIndex:0];
			[self.objects addObjectsFromArray:plist];
		}
	}

	[super requestDidFinishLoad:request];
}

- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
  // Error.
	[super request:request didFailLoadWithError:error];
}

@end