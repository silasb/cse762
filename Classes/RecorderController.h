//
//  RecorderController.h
//  Recorder
//
//  Created by Silas on 4/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RecorderController : NSObject <AVAudioRecorderDelegate> {
  IBOutlet UILabel          *label;
  IBOutlet UIButton         *_recordButton;
  AVAudioRecorder           *_recorder;
}

- (IBAction)recordButtonPressed:(UIButton *)sender;

@property (nonatomic, retain) UILabel*          label;
@property (nonatomic, retain) UIButton*         _recordButton;

@property (nonatomic, assign) AVAudioRecorder*  _recorder;
@end
