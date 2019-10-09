#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(weak) IBOutlet AVPlayerView *playerView1;
@property(weak) IBOutlet AVPlayerView *playerView2;
@property(weak) IBOutlet AVPlayerView *playerView3;
@property(weak) IBOutlet AVPlayerView *playerView4;
@property(weak) IBOutlet AVPlayerView *playerView5;
@property(weak) IBOutlet AVPlayerView *playerView6;
@property(weak) IBOutlet AVPlayerView *playerView7;
@property(weak) IBOutlet AVPlayerView *playerView8;
@property(weak) IBOutlet AVPlayerView *playerView9;

@property(readwrite) NSString *defaultGPUName;

@end

