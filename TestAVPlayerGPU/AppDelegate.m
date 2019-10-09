#import "AppDelegate.h"
#import <Metal/Metal.h>




@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end




@implementation AppDelegate
{
    id<MTLDevice> defaultDevice;
    NSMutableArray<AVPlayer*> *players;
}

- (NSArray<AVPlayerView*>*)playerViews
{
    return @[self.playerView1, self.playerView2, self.playerView3, self.playerView4, self.playerView5, self.playerView6, self.playerView7, self.playerView8, self.playerView9];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    defaultDevice = MTLCreateSystemDefaultDevice();
    self.defaultGPUName = defaultDevice.name;
    players = [NSMutableArray array];
    NSURL *url = [NSBundle.mainBundle URLForResource:@"video" withExtension:@"mp4"];
    for(AVPlayerView *playerView in self.playerViews)
    {
        AVPlayer *player = [AVPlayer playerWithURL:url];
        playerView.player = player;
        [players addObject:player];
    }
    [self play:nil];
}


- (IBAction)play:(id)sender
{
    for(AVPlayer *player in players)
    {
        [player seekToTime:kCMTimeZero];
        [player play];
    }
}


- (IBAction)hideOrUnhide:(id)sender
{
    for(AVPlayerView *playerView in self.playerViews)
    {
        playerView.hidden = !playerView.hidden;
    }
}

- (IBAction)setToNone:(id)sender
{
    for(AVPlayer *player in players)
    {
        player.preferredVideoDecoderGPURegistryID = 0;
    }
}

- (IBAction)setToSpecificGPU:(id)sender
{
    for(AVPlayer *player in players)
    {
        player.preferredVideoDecoderGPURegistryID = defaultDevice.registryID;
    }
}

@end

