//
//  RecorderAppDelegate.m
//  Recorder
//
//  Created by Silas on 4/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RecorderAppDelegate.h"
#import "RecorderViewController.h"

@implementation RecorderAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
  // Override point for customization after app launch
  [window addSubview:viewController.view];
  [window makeKeyAndVisible];
}


- (void)dealloc {
  [viewController release];
  [window release];
  [super dealloc];
}

@end
