//
//  ViewController.m
//  soothing
//
//  Created by Add0bbA on 09/05/14.
//  Copyright (c) 2014 PITSTOP. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) AVAudioPlayer *player;
@end

@implementation ViewController
@synthesize player;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initSound];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSound
{
//    NSURL *mp3URL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/mp3Files/Dalga.mp3", [[NSBundle mainBundle] resourcePath]]];
////    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:clickURL error:nil];
//    NSLog(@"mp3URL to play: %@", mp3URL);
    
    
//    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
//    resourcePath = [resourcePath stringByAppendingString:@"/mp3Files/Dalga.mp3"];
//    NSLog(@"Path to play: %@", resourcePath);
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Dalga"
                                         ofType:@"mp3"]];
    
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
//    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:resourcePath] error:&err];
//    player = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error:&err];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player.delegate = self;
        [player play];
        player.numberOfLoops = -1;
        player.currentTime = 0;
        player.volume = 1.0;
    }
}

- (IBAction)volumeController:(UISlider *)sender {
    [player setVolume:sender.value];
}
@end
