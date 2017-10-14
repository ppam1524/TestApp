//
//  AudioPlay.m
//  SidebarMenu
//
//  Created by Pavankumar on 13/10/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "AudioPlay.h"


@implementation AudioPlay


-(void)playSong:(NSString *)song
{
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath],song];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [self.audioPlayer play];
}
@end
