//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISBlackjackGame.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    FISBlackjackGame* game = [[FISBlackjackGame alloc] init];
    
    game.playBlackjack;
    game.playBlackjack;
    game.playBlackjack;
    
    return YES;
}

@end
