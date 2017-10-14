//
//  AudioPlay.h
//  SidebarMenu
//
//  Created by Pavankumar on 13/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlay : NSObject
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
-(void)playSong:(NSString *)song;
@end
