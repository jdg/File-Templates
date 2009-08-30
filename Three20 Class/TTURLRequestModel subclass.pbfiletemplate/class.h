//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//

#import <Three20/Three20.h>

@protocol «FILEBASENAMEASIDENTIFIER»Results <TTModel>
- (BOOL) hasMoreToLoad;
- (NSString *) remainingToLoad;
@property (nonatomic, readonly) NSMutableArray *results;
@end

@interface «FILEBASENAMEASIDENTIFIER» : TTURLRequestModel {
  NSMutableArray *objects;
	NSUInteger recordOffset;
	NSUInteger totalRecords;
}

@property (nonatomic, retain) NSMutableArray *objects;

- (BOOL) hasMoreToLoad;
- (NSString *) remainingToLoad;

@end