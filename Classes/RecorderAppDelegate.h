//
//  RecorderAppDelegate.h
//  Recorder
//
//  Created by Silas on 4/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecorderViewController;

@interface RecorderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RecorderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RecorderViewController *viewController;

@end

