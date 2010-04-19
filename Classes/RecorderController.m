//
//  RecorderController.m
//  Recorder
//
//  Created by Silas on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RecorderController.h"

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

@implementation RecorderController

@synthesize _recordButton;
@synthesize _recorder;

- (void)awakeFromNib {
  
  NSError *err = nil;
  
  NSMutableDictionary *recordSetting;
  recordSetting = [[NSMutableDictionary alloc] init];
	
  [recordSetting setValue: [NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
  [recordSetting setValue: [NSNumber numberWithFloat: 44100.0] forKey: AVSampleRateKey];
  [recordSetting setValue:[NSNumber numberWithInt: 2] forKey: AVNumberOfChannelsKey];
  
  [recordSetting setValue: [NSNumber numberWithInt: 16] forKey: AVLinearPCMBitDepthKey];
  [recordSetting setValue: [NSNumber numberWithBool: NO] forKey: AVLinearPCMIsBigEndianKey];
  [recordSetting setValue: [NSNumber numberWithBool: NO] forKey: AVLinearPCMIsFloatKey];
  
  // create a new dated file
  NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
  NSString *caldate = [now description];
  NSString *recorderFilePath;
  recorderFilePath = [[NSString stringWithFormat:@"%@/%@.caf", DOCUMENTS_FOLDER, caldate] retain];

  NSURL *url = [NSURL fileURLWithPath:recorderFilePath];
  err = nil;
  _recorder = [[ AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:&err];

  if(!_recorder){
    NSLog(@"recorder: %@ %d %@", [err domain], [err code], [[err userInfo] description]);
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle: @"Warning"
                               message: [err localizedDescription]
                              delegate: nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
    return;
  }
  
  // prepare to record
  [_recorder setDelegate:self];
  [_recorder prepareToRecord];
	
}

- (IBAction)recordButtonPressed:(UIButton *)sender {
  NSLog(@"Record button pressed");
  
  [_recorder record];
}

@end
