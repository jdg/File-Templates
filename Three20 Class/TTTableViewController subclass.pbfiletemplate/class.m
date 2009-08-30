//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//

«OPTIONALHEADERIMPORTLINE»
#import "AppDelegate.h"
#import "Constants.h"

@implementation «FILEBASENAMEASIDENTIFIER»

- (void) dealloc {
  [super dealloc];
}

- (id) init {
  if (self = [super init]) {
		self.tableViewStyle = UITableViewStyleGrouped;
		self.autoresizesForKeyboard = YES;
  }
  return self;
}

- (void) viewDidUnload {
  [super viewDidUnload];
}

- (void) loadView {
  [super loadView];
}

- (void) createModel {
  
}

@end
